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
    highlight = {
      keyword = "",
      after = "",
    },
  },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
  },
}
