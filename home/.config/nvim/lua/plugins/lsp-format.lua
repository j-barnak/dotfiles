return {
  "neovim/nvim-lspconfig",
  opts = {},
  config = function(_, opts)
    require("lsp-format").setup(opts)
  end,
}
