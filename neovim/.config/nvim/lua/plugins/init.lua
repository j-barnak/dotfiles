return {
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
  { "tpope/vim-fugitive" },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
}
