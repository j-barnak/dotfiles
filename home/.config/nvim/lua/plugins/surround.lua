return {
  "echasnovski/mini.surround",
  event = "VeryLazy",
  version = "*",
  keys = {
    { mode = { "x" }, "S", ":<C-u>lua MiniSurround.add('visual')<CR>", desc = "Surround in visual", silent = true },
  },
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      add = "'a", -- Add surrounding in Normal and Visual modes
      delete = "'d", -- Delete surrounding
      find = "'f", -- Find surrounding (to the right)
      find_left = "'F", -- Find surrounding (to the left)
      highlight = "'h", -- Highlight surrounding
      replace = "'r", -- Replace surrounding
      update_n_lines = "'n", -- Update `n_lines`
    },
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
}
