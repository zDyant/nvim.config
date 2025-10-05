return {
  {
    'nvzone/floaterm',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = 'FloatermToggle',
    config = function()
      require 'floaterm'.setup({
        border = true,
      })
      vim.keymap.set('n', '<C-\\>', ':FloatermToggle<CR>', { desc = 'Open floating terminal' })
    end,
  },
}
