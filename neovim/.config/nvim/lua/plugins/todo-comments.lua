-- FIXME: Getting rid of a keyword breaks telecsope extension
return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  opts = {
    signs = false,
    keywords = {
      FIX = {
        color = "#56B6C2",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
    },
    merge_keywords = true,
  },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
  },
}
