return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = false,
  version = false,
  opts = {
    char = "╎",
  },
  config = function(_, opts)
    vim.g.indent_blankline_use_treesitter = true
    require("indent_blankline").setup(opts)
  end,
}
