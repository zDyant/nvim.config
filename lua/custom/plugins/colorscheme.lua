return {
  -- { 'catppuccin/nvim' },
  -- { 'sontungexpt/witch' },
  -- { 'rose-pine/neovim' },
  -- { 'olivercederborg/poimandres.nvim' },
  -- { 'antonio-hickey/citrus-mist' },
  {
    'diegoulloao/neofusion.nvim',
    config = function()
      -- Load the colorscheme here.
      -- Many themes have different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'neofusion'
    end,
  },

}
