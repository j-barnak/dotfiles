return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  priority = 500,
  lazy = false,
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "View TODOs and similar" },
  },
  opts = {
    signs = false, -- show icons in the signs column
    highlight = {
      keyword = "fg",
    },
  },
}
