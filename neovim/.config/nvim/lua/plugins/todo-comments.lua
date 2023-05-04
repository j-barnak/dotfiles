return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTelescope" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    signs = false,
    highlight = {
      keyword = "",
      after = "",
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>",                         desc = "Todo" },
    { "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
}
