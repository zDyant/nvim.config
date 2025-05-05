-- https://github.com/akinsho/bufferline.nvim
return {
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    branch = 'main',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
    keys = {
      { "<Tab>",   ":BufferLineCycleNext<CR>",  desc = "Next Buffer" },
      { "<S-Tab>", ":BufferLineCyclePrev<CR>",  desc = "Prev Buffer" },
      { "bc",      ":BufferLinePick<CR>",       desc = "Go to selected buffer" },
      { "bl",      ":BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "bh",      ":BufferLineCloseLeft<CR>",  desc = "Delete Buffers to the Left" },
      { "bc",      ":BufferLinePickClose<CR>",  desc = "Delete selected buffer" }
    }
  },
}
