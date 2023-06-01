return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      comment = { italic = true },
      keyword = { italic = false },
      type = { italic = false },
      storageclass = { italic = false },
      structure = { italic = false },
      parameter = { italic = false },
      annotation = { italic = false },
      tag_attribute = { italic = false },
    },
    filter = "machine",
  },
  config = function(_, opts)
    require("monokai-pro").setup(opts)
    vim.cmd([[colorscheme monokai-pro]])
    vim.cmd("highlight! link Todo Comment")
    vim.cmd([[hi NvimTreeWinSeparator guifg=#273136 guibg=NONE]])
  end,
}
