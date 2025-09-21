return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'LazyFile' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        nix = { 'nixfmt' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd' },
        htm = { 'prettierd' },
        css = { 'prettierd' },
        markdown = { 'prettierd' },
        latex = { 'tex-fmt' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
