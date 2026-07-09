return {
  {
    'olimorris/codecompanion.nvim',
    -- Mcphub does not suport 19.x.x
    version = '^18.0.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'j-hui/fidget.nvim',
      {
        'OXY2DEV/markview.nvim',
        lazy = false,
        opts = {
          preview = {
            filetypes = { 'markdown', 'codecompanion' },
            ignore_buftypes = {},
          },
        },
      },
      {
        'ravitemer/mcphub.nvim',
        dependencies = {
          'nvim-lua/plenary.nvim',
        },
        build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
        config = function()
          require('mcphub').setup()
        end,
      },
    },
    opts = {
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            -- MCP Tools
            make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
            show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
            add_mcp_prefix_to_tool_names = true, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
            show_result_in_chat = true, -- Show tool results directly in chat buffer
            -- MCP Resources
            make_vars = true, -- Convert MCP resources to #variables for prompts
            -- MCP Prompts
            make_slash_commands = true, -- Add MCP prompts as /slash commands
          },
        },
      },
      adapters = {
        http = {
          ollama = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              env = {
                url = 'http://localhost:11434',
                -- api_key = 'ollama',
                chat_url = '/v1/chat/completions',
              },
              schema = {
                model = {
                  default = 'qwen3.5:9b',
                },
              },
            })
          end,
        },
      },

      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
        agent = {
          adapter = 'ollama',
        },
      },
    },
    config = function(_, opts)
      require('codecompanion').setup(opts)

      local progress = require 'fidget.progress'
      local handles = {}
      local group = vim.api.nvim_create_augroup('CodeCompanionFidget', {})

      vim.api.nvim_create_autocmd('User', {
        pattern = 'CodeCompanionRequestStarted',
        group = group,
        callback = function(e)
          handles[e.data.id] = progress.handle.create {
            title = 'CodeCompanion',
            message = 'Thinking...',
            lsp_client = { name = e.data.adapter.formatted_name },
          }
        end,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'CodeCompanionRequestFinished',
        group = group,
        callback = function(e)
          local h = handles[e.data.id]
          if h then
            h.message = e.data.status == 'success' and 'Done' or 'Failed'
            h:finish()
            handles[e.data.id] = nil
          end
        end,
      })
    end,
  },
}
