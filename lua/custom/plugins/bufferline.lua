-- https://github.com/akinsho/bufferline.nvim
return {
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    branch = 'main',
    dependencies = 'nvim-mini/mini.icons',
    opts = {},
    keys = {
      { "<Tab>",   ":BufferLineCycleNext<CR>",  desc = "Next Buffer", silent = true },
      { "<S-Tab>", ":BufferLineCyclePrev<CR>",  desc = "Prev Buffer", silent = true },
      { "bc",      ":BufferLinePick<CR>",       desc = "Go to selected buffer", silent = true },
      { "bl",      ":BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right", silent = true, },
      { "bh",      ":BufferLineCloseLeft<CR>",  desc = "Delete Buffers to the Left", silent = true },
      { "bc",      ":BufferLinePickClose<CR>",  desc = "Delete selected buffer", silent = true }
    }
  },
}
