return {
  {
    'folke/twilight.nvim',
    event = 'LazyFile',
    config = function()
      require('twilight').setup()

      -- Workarround
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          require("twilight").enable()
      end,
      })

    end,
  }
}
