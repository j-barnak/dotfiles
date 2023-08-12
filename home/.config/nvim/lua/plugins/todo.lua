-- TODO: - Remove icons for every thing
--       - Add to telescope
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
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
