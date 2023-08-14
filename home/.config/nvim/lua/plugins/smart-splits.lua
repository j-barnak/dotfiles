return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    -- stylua: ignore start
   { "<A-h>", function () require("smart-splits").resize_left() end, silent = true },
   { "<A-j>", function () require("smart-splits").resize_down() end, silent = true },
   { "<A-k>", function () require("smart-splits").resize_up() end, silent = true },
   { "<A-l>", function () require("smart-splits").resize_right() end, silent = true },
   { "<C-h>", function () require("smart-splits").move_cursor_left() end, silent = true },
   { "<C-j>", function () require("smart-splits").move_cursor_down() end, silent = true },
   { "<C-k>", function () require("smart-splits").move_cursor_up() end, silent = true },
   { "<C-l>", function () require("smart-splits").move_cursor_right() end, silent = true },
   { "<leader>-", "<cmd>split<cr>", silent = true },
   { "<leader>=", "<cmd>vsplit<cr>", silent = true },
    -- stylua: ignore end
  },
}
