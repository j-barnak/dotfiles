return {
  "gbprod/yanky.nvim",
  lazy = false,
  dependencies = {
    { "kkharji/sqlite.lua" },
  },
  opts = {
    highlight = {
      timer = 0,
    },
  },
  config = function(_, opts)
    require("yanky").setup(opts)
    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
    vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
    vim.keymap.set("n", "<leader>p", "a<space><esc><Plug>(YankyPutAfter)")
  end,
}
