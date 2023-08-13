return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lsp-format").setup({})
  end,
}
