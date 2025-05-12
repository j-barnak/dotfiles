return {
  "lukas-reineke/lsp-format.nvim",
  opts = {},
  config = function(_, opts)
    require("lsp-format").setup(opts)
  end,
}
