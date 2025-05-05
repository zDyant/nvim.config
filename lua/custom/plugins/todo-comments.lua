-- https://github.com/folke/todo-comments.nvim
return {
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'LazyFile',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
