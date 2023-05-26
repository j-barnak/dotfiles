return {
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   lazy = false,
  -- },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
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
