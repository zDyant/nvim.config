return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        servers = {
          settings = {
            ["rust_analyzer"] = {},
          },
          on_attach = function(client, bufnr)
            vim.keymap.set('n', 'gra', function()
              vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
              -- or vim.lsp.buf.codeAction() if you don't want grouping.
            end, { silent = true, buffer = bufnr })

            vim.keymap.set( 'n', 'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
              function()
                vim.cmd.RustLsp { 'hover', 'actions' }
              end,
              { silent = true, buffer = bufnr }
            )
          end,
        },
      }
    end,
  },
}
