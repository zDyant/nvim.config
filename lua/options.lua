-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`


-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Copy indent from current line when starting new one (default: true)
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2

-- Borders on layout
vim.o.winborder = 'single'

-- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.o.softtabstop = 4

vim.o.showtabline = 2 -- Always show tabs (default: 1)

-- We don't need to see things like -- INSERT -- anymore (default: true)
vim.o.showmode = false

-- Sync clipboard between OS and Neovim. (default: '')
vim.o.clipboard = 'unnamedplus'

-- Display lines as one long line (default: true)
vim.o.wrap = false

-- Companion to wrap, don't split words (default: false)
vim.o.linebreak = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

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

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- vim: ts=2 sts=2 sw=2 et
