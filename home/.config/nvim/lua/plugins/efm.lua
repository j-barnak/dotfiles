-- TODO: Have LSPs that support formatting handle their own formatting via
--       `lsp-format`
return {
  "creativenull/efmls-configs-nvim",
  version = "v0.2.x",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "lukas-reineke/lsp-format.nvim" },
  },
  config = function()
    local efmls = require("efmls-configs")

    -- JavaScript
    local prettier_d = require("efmls-configs.linters.eslint_d")
    local eslint_d = require("efmls-configs.formatters.prettier_d")
    -- Lua
    local stylua = require("efmls-configs.formatters.stylua")

    efmls.init({
      init_options = {
        documentFormatting = true,
      },
    })

    efmls.setup({
      javascript = {
        linter = eslint_d,
        formatter = prettier_d,
      },
      lua = {
        formatter = stylua,
      },
    })
    -- LSP Format
    require("lsp-format").setup {}

    require("lspconfig").efm.setup({
      on_attach = require("lsp-format").on_attach,
      init_options = { documentFormatting = true },
      settings = {
        languages = {
          typescript = { prettier_d },
          yaml = { prettier_d },
          lua = { stylua },
        },
      },
    })
  end,
}
