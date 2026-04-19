-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
--
-- WARN: Mosty options are managed by mini.basics
-- :h MiniBasics.config

-- I want UI opaque
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- Display lines as one long line (default: true)
vim.o.wrap = true

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Copy indent from current line when starting new one (default: true)
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Sync clipboard between OS and Neovim. (default: '')
vim.o.clipboard = 'unnamedplus'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term -- NOTE: You can change these options as you wish! --  For more options, you can see `:help option-list` -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term -- NOTE: You can change these options as you wish!
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term -- NOTE: You can change these options as you wish!
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
---@diagnostic disable-next-line: missing-fields
-- has to be vim.opt
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- vim: ts=2 sts=2 sw=2 et
