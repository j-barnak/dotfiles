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
      add = "gza", -- Add surrounding in Normal and Visual modes
      delete = "gzd", -- Delete surrounding
      find = "gzf", -- Find surrounding (to the right)
      find_left = "gzF", -- Find surrounding (to the left)
      highlight = "gzh", -- Highlight surrounding
      replace = "gzr", -- Replace surrounding
      update_n_lines = "gzn", -- Update `n_lines`
    },
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
}
