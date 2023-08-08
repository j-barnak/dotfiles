-- TODO: Implelement using lazy
return {
  "gbprod/yanky.nvim",
  dependencies = {
    { "kkharji/sqlite.lua" },
  },
  lazy = false,
  opts = {
    highlight = {
      timer = 0,
    },
  },
  config = function(_, opts)
    require("yanky").setup(opts)
    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
    vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
    vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
    vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
  end,
}
