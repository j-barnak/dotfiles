return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    { "tpope/vim-sleuth" },
  },
  opts = {},
  config = function(_, opts)
    require("indent_blankline").setup(opts)
    vim.cmd("let g:indent_blankline_filetype_exclude = ['markdown']")
  end,
}
