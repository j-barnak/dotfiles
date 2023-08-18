return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader><leader>j", "<cmd>DiffviewOpen<cr>" },
    { "<leader><leader>h", "<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>" },
  },
  opts = {},
}
