return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    {
      "<leader>fe",
      mode = { "n" },
      "<cmd>Oil --float<cr>",
      desc = "Open Oil",
    },
  },
  opts = {
    float = {
      -- Padding around the floating window
      padding = 5,
      max_width = 120,
      max_height = 100,
    },
    keymaps = {
      ["h"] = "actions.parent",
      ["H"] = "actions.parent",
    },
    use_default_keymaps = true,
  },
}
