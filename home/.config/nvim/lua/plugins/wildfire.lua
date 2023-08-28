return {
  "sustech-data/wildfire.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    keymaps = {
      init_selection = "<S-CR>",
      node_incremental = "<S-CR>",
      node_decremental = "<S-BS>",
    },
  },
}
