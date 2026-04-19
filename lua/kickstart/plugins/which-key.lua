-- https://github.com/folke/which-key.nvim
---@module 'lazy'
---@type LazySpec
return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    ---@module 'which-key'
    ---@type wk.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font, },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>o', group = '[O]penCode', mode = { 'n' , 'v' } },
        { '<leader>x', group = 'Trouble' },
        { 'gr', group = 'LSP Actions', mode = { 'n' } },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
