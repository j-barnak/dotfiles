-- TODO: - Remove icons
--       - Add to telescope
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      TODO = { icon = "" },
    },
    highlight = {
      keyword = "fg",
    },
  },
}
