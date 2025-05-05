<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ea85de2 (add lazy-events plugin and config)
-- https://github.com/bwpge/lazy-events.nvim
vim.g.lazy_events_config = {
  simple = {
    LazyFile = { "BufReadPost", "BufNewFile", "BufWritePre" },
  }
}

<<<<<<< HEAD
require('lazy').setup({
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --
  --
  -- Required for event = 'LazyFile'
  { "bwpge/lazy-events.nvim", import = "lazy-events.import", lazy = false },
  
  -- import automatically all plugins
  { import = 'custom.plugins' },
  { import = 'kickstart.plugins'},

=======
=======
>>>>>>> ea85de2 (add lazy-events plugin and config)
require('lazy').setup({
  --
  -- import automatically all plugins
  --
  -- Required for event = 'LazyFile'
  { "bwpge/lazy-events.nvim", import = "lazy-events.import", lazy = false },
  { import = 'custom.plugins' },
  { import = 'kickstart.plugins'},
  --
>>>>>>> 982d981 (import plugins)
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = {},
    -- icons = vim.g.have_nerd_font and {} or {
    --   cmd = '⌘',
    --   config = '🛠',
    --   event = '📅',
    --   ft = '📂',
    --   init = '⚙',
    --   keys = '🗝',
    --   plugin = '🔌',
    --   runtime = '💻',
    --   require = '🌙',
    --   source = '📄',
    --   start = '🚀',
    --   task = '📌',
    --   lazy = '💤 ',
    -- },
  },
})

-- vim: ts=2 sts=2 sw=2 et
