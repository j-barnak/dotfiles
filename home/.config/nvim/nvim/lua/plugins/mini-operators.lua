return {
  "echasnovski/mini.operators",
  version = false,
  opts = {
    exchange = {
      prefix = "X",
    },
    multiply = {
      prefix = "M",
    },
  },
  config = function(_, opts)
    require("mini.operators").setup(opts)
  end,
}
