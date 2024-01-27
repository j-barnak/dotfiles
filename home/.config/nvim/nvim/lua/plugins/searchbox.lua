return {
  "VonHeikemen/searchbox.nvim",
  event = "VeryLazy",
  dependencies = {
    { "MunifTanjim/nui.nvim" },
  },
  keys = {
    { "<leader>o", "<cmd>SearchBoxMatchAll<cr>", desc = "Search box" },
  },
  opts = {},
}
