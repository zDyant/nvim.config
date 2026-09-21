return {
  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.pairs').setup()
      require('mini.move').setup()
      require('mini.align').setup()
      require('mini.cursorword').setup()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
            local git = statusline.section_git { trunc_width = 40, icon = '' }
            local diff = statusline.section_diff { trunc_width = 75 }
            local diagnostics = statusline.section_diagnostics {
              trunc_width = 75,
              icon = '󰒡',
              signs = { ERROR = ' ', WARN = ' ', INFO = ' ', HINT = ' ' },
            }
            local lsp = statusline.section_lsp { trunc_width = 75, icon = '󰒋' }
            local filename = statusline.section_filename { trunc_width = 140 }
            local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
            local location = statusline.section_location { trunc_width = 75 }
            local search = statusline.section_searchcount { trunc_width = 75 }

            return statusline.combine_groups {
              { hl = mode_hl, strings = { '❯', mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { '󰈔', filename } },
              '%=',
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, '󰍎 ' .. location } },
            }
          end,
          inactive = function()
            return '%#MiniStatuslineInactive#  %F%m%r%='
          end,
        },
      }
      vim.o.laststatus = 3
      require('mini.indentscope').setup {
        options = {
          try_as_border = true,
        },
        symbol = '|',
      }
      require('mini.splitjoin').setup {
        mappings = { toggle = 'gs', split = '', join = '' },
      }

      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup {
        -- INFO: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
        mappings = {
          around_next = 'aa',
          inside_next = 'ii',
        },
        n_lines = 500,
      }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      require('mini.basics').setup {
        options = { extra_ui = true },
        mappings = {
          windows = true,
          move_with_alt = true,
        },
      }
      require('mini.hipatterns').setup {
        highlighters = {
          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
        vim.keymap.set('n', '\\Z', ':lua MiniHipatterns.toggle()<CR>', { desc = 'Toggle colorizer', silent = true }),
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
