return {
  "echasnovski/mini.surround",
  event = "VeryLazy",
  version = "*",
  keys = {
    { mode = { "x" }, "S", ":<C-u>lua MiniSurround.add('visual')<CR>", desc = "Surround in visual", silent = true },
  },
  config = function()
    require("mini.surround").setup()
  end,
}
