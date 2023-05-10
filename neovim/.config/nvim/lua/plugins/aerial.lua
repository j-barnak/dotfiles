return {
  "stevearc/aerial.nvim",
  opts = {
    layout = {
      min_width = 25,
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>dd", "<cmd>AerialToggle<cr>", desc = "List symbols" },
  },
}
