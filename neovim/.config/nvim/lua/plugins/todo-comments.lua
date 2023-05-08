return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  opts = {
    signs = false,
    keywords = {
      FIX = {
        color = "#56B6C2",                          -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      },
      TODO = { color = "#C678DD" },
    },
  },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
  },
}
