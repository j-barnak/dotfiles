return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader><leader>h", "<cmd>DiffviewOpen<cr>" },
    { "<leader><leader>j", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>" },
  },
  opts = {},
}
