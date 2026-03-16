return {
  {
    'obsidian-nvim/obsidian.nvim',
    ft = 'markdown',
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = 'default',
          path = '~/Documents/college',
        },
      },
    },

    config = function()
      require('obsidian').setup {
        follow_img_func = function(img)
          vim.fn.jobstart({ 'xdg-open', url})
        end,
      }
    end,
  },
}
