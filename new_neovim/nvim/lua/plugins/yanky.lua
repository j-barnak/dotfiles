-- BUG: There's a bug with wl-clipboard which causes yank.nvim to hang.
--      https://github.com/gbprod/yanky.nvim/issues/37
--      https://github.com/gbprod/yanky.nvim/issues/123
return {
  "gbprod/yanky.nvim",
  dependencies = {
    { "kkharji/sqlite.lua" },
  },
  events = "VeryLazy",
  opts = {
    highlight = {
      timer = 0,
    },
    system_clipboard = {
      sync_with_ring = false,
    },
  },
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
    { "<c-n>", "<Plug>(YankyCycleBackward)" },
    { "<c-p>", "<Plug>(YankyCycleForward)" },
    { "<leader>p", "a<space><esc><Plug>(YankyPutAfter)" },
  },
  config = function(_, opts)
    require("yanky").setup(opts)
  end,
}
