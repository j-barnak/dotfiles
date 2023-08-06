return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  keys = {
    { "<leader>q", "<cmd>q<cr>", { desc = "Faster [Q]uit" } },
  },
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>9", "<cmd>split<cr>")
    vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
    -- moving between splits
    vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
    vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
    vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
    vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
    vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Faster [Q]uit" })
  end,
}
