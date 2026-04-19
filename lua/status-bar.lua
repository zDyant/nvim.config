vim.opt.laststatus = 3  -- one global statusline
vim.opt.statusline = table.concat({
  " ",
  "%f",        -- file path
  "%m",        -- modified flag [+]
  "%=",        -- align right
  "%l/%L",     -- line:col
  " ",
  "%p%%",      -- progress
  " "
})
