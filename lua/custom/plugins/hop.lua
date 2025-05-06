return {
  {
    'smoka7/hop.nvim', -- Neovim motions on speed!
    version = "*",
    event = "LazyFile",
    config = function()
      local hop = require('hop')
      hop.setup()
      -- local directions = require('hop.hint').HintDirection

      -- Hop word on file
      vim.keymap.set('', 'f', function()
        hop.hint_words({ current_line_only = false })
      end, { remap = true })

      -- Hop pattern on line
      vim.keymap.set('', 'F', function()
        hop.hint_patterns({ current_line_only = true })
      end, { remap = true })

      -- Hop pattern on file
      vim.keymap.set('', 'T', function()
        hop.hint_patterns({ current_line_only = false })
      end, { remap = true })

      -- Hop file
      vim.keymap.set('', 't', function()
        hop.hint_lines({})
      end, { remap = true })
    end
  },
}
