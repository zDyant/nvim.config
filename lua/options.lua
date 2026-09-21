-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
--
-- WARN: Mosty options are managed by mini.basics
-- https://github.com/nvim-mini/mini.nvim/blob/main/lua/mini/basics.lua
-- :h MiniBasics.config

-- I want UI opaque
vim.opt.winblend = 0
vim.opt.pumblend = 0
local diagnostic_signs = {
  Error = ' ',
  Warn = ' ',
  Hint = '',
  Info = '',
}

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
      [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
      [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
      [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
    },
  },
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

-- Display lines as one long line (default: true)
vim.o.wrap = true

vim.opt.showmatch = true -- highlights matching brackets
vim.o.relativenumber = true

-- Copy indent from current line when starting new one (default: true)
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.softtabstop = 4
vim.o.expandtab = true

---@diagnostic disable-next-line: missing-fields
-- has to be vim.opt
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
