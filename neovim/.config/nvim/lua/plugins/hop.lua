return {
  "j-barnak/hop.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "f",
      mode = { "n", "x", "o" },
      "<cmd>HopChar1AC<cr>",
      desc = "Hop forward",
    },
    {
      "F",
      mode = { "n", "x", "o" },
      "<cmd>HopChar1BC<cr>",
      desc = "Hop backwards",
    },
  },
}
