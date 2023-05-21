return {
  "gbprod/substitute.nvim",
  event = "VeryLazy",
  config = function()
    require("substitute").setup()
    vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
    vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
    vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
    vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })
    vim.keymap.set("n", "<leader>S", require("substitute.range").operator, { noremap = true })
    vim.keymap.set("x", "<leader>S", require("substitute.range").visual, { noremap = true })
    vim.keymap.set("x", "X", require("substitute.exchange").visual, { noremap = true })
  end,
}
