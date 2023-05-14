return {
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "akinsho/git-conflict.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "folke/neodev.nvim",
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
}
