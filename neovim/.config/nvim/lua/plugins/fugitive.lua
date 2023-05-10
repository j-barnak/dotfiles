return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    { "<leader>gg", "<cmd>tab Git commit<cr>", desc = "Git commit in separate tab" },
    { "<leader>gP", "<cmd>Git push<cr>",       desc = "Push commit to remote" }
  }
}
