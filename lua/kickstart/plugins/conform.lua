---@module 'lazy'
---@type LazySpec
return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
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
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        astro = { 'injected', lsp_format = 'first' },
        bash = { 'shfmt' },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'gofmt' },
        html = { 'prettierd', 'injected' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        jsonc = { 'prettierd', 'prettier', stop_after_first = true },
        latex = { 'tex-fmt' },
        less = { 'prettierd', 'prettier', stop_after_first = true },
        lua = { 'stylua' },
        markdown = { 'prettierd', 'injected' },
        nix = { 'alejandra', 'injected' },
        python = { 'ruff_format' },
        quarto = { 'injected' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        scss = { 'prettierd', 'prettier', stop_after_first = true },
        sh = { 'shfmt' },
        toml = { 'taplo' },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },
      },
      formatters = {
        injected = {
          options = {
            -- An unsupported or malformed embedded block should not prevent
            -- the host document from being formatted.
            ignore_errors = true,
            -- Use the stateless Prettier CLI for injected regions. Running
            -- multiple prettierd jobs in parallel can race its daemon socket.
            lang_to_formatters = {
              css = { 'prettier' },
              html = { 'prettier' },
              javascript = { 'prettier' },
              json = { 'prettier' },
              jsonc = { 'prettier' },
              less = { 'prettier' },
              scss = { 'prettier' },
              typescript = { 'prettier' },
              yaml = { 'prettier' },
            },
          },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
