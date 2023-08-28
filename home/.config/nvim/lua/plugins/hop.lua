return {
  "smoka7/hop.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "f",
      mode = { "n", "o", "x" },
      "<cmd>HopChar1AC<cr>",
      desc = "Hop forward",
    },
    {
      "F",
      mode = { "n", "o", "x" },
      "<cmd>HopChar1BC<cr>",
      desc = "Hop backwards",
    },
  },
}
