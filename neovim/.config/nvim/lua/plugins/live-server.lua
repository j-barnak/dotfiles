return {
  "barrett-ruth/live-server.nvim",
  build = "yarn global add live-server",
  keys = {
    { "<leader>ll", "<cmd>LiveServerStart<cr>", desc = "Start live server" },
    { "<leader>ls", "<cmd>LiveServerStop<cr>", desc = "Stop live server" },
  },
  opts = {},
  config = true,
}
