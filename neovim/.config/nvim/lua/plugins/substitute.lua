--  TODO: Learn how to use substitute to its fullest extent
return {
  "gbprod/substitute.nvim",
  event = "VeryLazy",
  config = function()
    require("substitute").setup()
    local sub = require('substitute.exchange')
    vim.keymap.set("x", "X", sub.visual, { noremap = true })
  end
}
