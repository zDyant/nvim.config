return {
  {
    'obsidian-nvim/obsidian.nvim',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      {
        'saghen/blink.cmp',
        opts = {
          fuzzy = { implementation = 'lua' }, -- no need to build binary
        },
      },
      { 'OXY2DEV/markview.nvim', lazy = false },
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = 'default',
          path = '~/Documents/obsidian',
        },
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ 'xdg-open', url }, { detach = true })
      end,

      follow_img_func = function(img)
        vim.fn.jobstart({ 'xdg-open', img }, { detach = true })
      end,

      open = {
        func = function(uri)
          vim.fn.jobstart({ 'xdg-open', uri }, { detach = true })
        end,
      },
    },
  },
}
