-- LSP Plugins
---@module 'lazy'
---@type LazySpec
return {
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- WARN: https://github.com/williamboman/mason.nvim/issues/428#issuecomment-1357203892
      {
        'mason-org/mason.nvim',
        ---@module 'mason.settings'
        ---@type MasonSettings
        ---@diagnostic disable-next-line: missing-fields
        opts = { PATH = 'append' },
      },
      -- Maps LSP server names between nvim-lspconfig and Mason package names.
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = {
            override_vim_notify = true,
          },
        },
      },
    },
    config = function()
      -- INFO: function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method('textDocument/documentHighlight', event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client:supports_method('textDocument/inlayHint', event.buf) then
            map('\\H', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      ---@type table<string, vim.lsp.Config>
      local servers = {
        rust_analyzer = {},
        ts_ls = {},
        astro = {},
        hyprls = {},
        cssls = {},
        html = {},
        dockerls = {},
        stylua = {},
        -- nil_ls = { enabled = false },
        -- Nixd is not avaible on mason

        -- Special Lua Config, as recommended by neovim help docs
        lua_ls = {
          on_init = function(client)
            client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                version = 'LuaJIT',
                path = { 'lua/?.lua', 'lua/?/init.lua' },
              },
              workspace = {
                checkThirdParty = false,
                -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
                  '${3rd}/luv/library',
                  '${3rd}/busted/library',
                }),
              },
            })
          end,
          ---@type lspconfig.settings.lua_ls
          settings = {
            Lua = {
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              format = { enable = false }, -- Formatted by stylua
            },
          },
        },
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'nix',
        callback = function(args)
          vim.lsp.start {
            name = 'nixd',
            cmd = { 'nixd' },
            root_dir = vim.fs.root(args.buf, { 'flake.nix', 'default.nix', '.git' }) or vim.fn.getcwd(),
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            settings = {
              nixd = {
                nixpkgs = {
                  expr = 'import <nixpkgs> { }',
                },
                formatting = {
                  command = { 'nixfmt' },
                },
                options = {
                  nixos = {
                    expr = '(builtins.getFlake ("git+file://" + toString /home/zdyant/Documents/dots/)).nixosConfigurations.zdyant.options',
                  },
                  home_manager = {
                    expr = '(builtins.getFlake (builtins.toString /home/zdyant/Documents/dots/)).nixosConfigurations.zdyant.options.home-manager.users.type.getSubOptions []',
                  },
                },
              },
            },
          }
        end,
      })

      -- INFO: `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'nixfmt', -- Nix formatter
        'rust-analyzer',
        'stylua', -- Lua formatter
        'prettierd', -- Multi-language formatter
        'typescript-language-server', -- JS/TS LSP
        'html-lsp', -- HTML LSP
        'css-lsp', -- CSS LSP
        'tex-fmt', -- LaTeX formatter
        'hyprls', -- Hyprlang formatter
        'astro-language-server',
        'tree-sitter-cli',
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      for name, server in pairs(servers) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
