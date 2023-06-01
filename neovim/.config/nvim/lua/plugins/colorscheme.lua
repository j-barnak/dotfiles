return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      comment = { italic = true },
      keyword = { italic = false }, -- any other keyword
      type = { italic = false }, -- (preferred) int, long, char, etc
      storageclass = { italic = false }, -- static, register, volatile, etc
      structure = { italic = false }, -- struct, union, enum, etc
      parameter = { italic = false }, -- parameter pass in function
      annotation = { italic = false },
      tag_attribute = { italic = false }, -- attribute of tag in reactjs
    },
    filter = "machine",
  },
  config = function(_, opts)
    require("monokai-pro").setup(opts)
    vim.cmd([[colorscheme monokai-pro]])
    vim.cmd("highlight! link Todo Comment") -- Must be after colorscheme
    vim.cmd([[hi NvimTreeWinSeparator guifg=#273136 guibg=NONE]]) -- Must be after colorscheme
  end,
}
