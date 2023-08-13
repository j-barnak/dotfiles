return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  keys = {
    -- stylua: ignore start
    { "<leader>e", function () require("harpoon.mark").add_file() end },
    { "<leader>a", function () require("harpoon.ui").toggle_quick_menu() end },
    -- stylua: ignore end
  },
  opts = {},
}
