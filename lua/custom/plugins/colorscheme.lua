return {
  -- { 'catppuccin/nvim' },
  -- { 'sontungexpt/witch' },
  -- { 'rose-pine/neovim' },
  -- { 'diegoulloao/neofusion.nvim' },
  -- { 'olivercederborg/poimandres.nvim' },
  -- { 'antonio-hickey/citrus-mist' },
  {
    'shatur/neovim-ayu',
    config = function()
      vim.cmd.colorscheme 'ayu'
    end,
  },
}
