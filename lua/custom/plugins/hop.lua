return {
  {
    'smoka7/hop.nvim', -- Neovim motions on speed!
    version = '*',
    event = 'LazyFile',
    config = function()
      local hop = require 'hop'
      hop.setup()
      -- local directions = require('hop.hint').HintDirection

      -- Hop word on file
      vim.keymap.set('', 'f', function()
        hop.hint_words { current_line_only = false }
      end, { remap = true })

      -- Delete -1 char
      vim.keymap.set('o', 'f', function()
        hop.hint_words { hint_offset = -1, current_line_only = false }
      end, { remap = true, desc = "Jump to word's first character" })

      vim.keymap.set('n', 'F', function()
        hop.hint_char2 {}
      end, { remap = true, desc = 'Jump to pattern with two keys' })

      -- Hop line, ignore whitespaces
      vim.keymap.set('n', 't', function()
        hop.hint_lines_skip_whitespace {}
      end, { remap = true, desc = 'Hop line ignoring white spaces' })

      -- Hop pattern on file
      vim.keymap.set('', 'T', function()
        hop.hint_patterns { current_line_only = false }
      end, { remap = true })
    end,
  },
}
