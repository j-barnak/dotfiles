return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    { "tpope/vim-sleuth" },
  },
  config = function()
    require("indent_blankline").setup({})
    vim.cmd("let g:indent_blankline_filetype_exclude = ['markdown', 'text', '', 'asm', 'make']")
  end,
}
