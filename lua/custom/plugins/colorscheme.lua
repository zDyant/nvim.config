return {
  -- { 'catppuccin/nvim' },
  -- { 'sontungexpt/witch' },
  { 'rose-pine/neovim' },
  -- { 'olivercederborg/poimandres.nvim' },
  -- { 'antonio-hickey/citrus-mist' },
  {
    'diegoulloao/neofusion.nvim',
    config = function()
      vim.cmd.colorscheme 'neofusion'
    end,
  },
}
