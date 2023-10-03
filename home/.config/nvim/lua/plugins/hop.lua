return {
  "j-barnak/hop.nvim",
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
  config = function(_, opts)
    require("hop").setup(opts)
    vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#EBCD8B", bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#BF616A", bold = true })
    vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#D08770" })
  end,
}
