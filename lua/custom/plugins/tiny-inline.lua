return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
    opts = {
      preset = 'minimal',
      options = {
        use_icons_from_diagnostic = true,
        multilines = {
          enabled = true,
        },
      },
    },
  },
}
