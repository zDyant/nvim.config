return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        -- size can be a number or function which is passed the current terminal
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2, -- degree to darken terminal colour: 1 for dark, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether open mapping works in insert mode
        persist_size = false,
        -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = "float",
        close_on_exit = true, -- close terminal window when process exits
        auto_scroll = true, -- auto scroll to bottom on terminal output
        shell = nil, -- use default shell

        -- Only relevant if direction = 'float'
        float_opts = {
          border = "single", -- single | double | shadow | curved | etc
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },

        winbar = {
          enabled = false,
        },

        -- Add executables on the config.lua
        -- { cmd, keymap, description, direction, size }
        execs = {
          { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
          { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
          { nil, "<M-3>", "Float Terminal", "float", nil },
        },
      })
    end,
  }
}
