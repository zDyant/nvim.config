return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.pairs').setup()
      require('mini.move').setup()
      require('mini.align').setup()
      require('mini.cursorword').setup()
      require('mini.icons').setup()
      require('mini.indentscope').setup({
        options = {
            try_as_border = true,
        },
        symbol = '|',
      })
      require('mini.splitjoin').setup({
          mappings = {toggle = 'gs', split = '', join = '',},
      })

      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
