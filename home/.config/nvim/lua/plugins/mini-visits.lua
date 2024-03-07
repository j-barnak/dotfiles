return {
  -- {
  --   "echasnovski/mini.pick",
  --   event = "VeryLazy",
  --   opts = {},
  --   config = function(_, opts)
  --     require("mini.pick").setup(opts)
  --   end,
  -- },
  {
    "echasnovski/mini.visits",
    event = "VeryLazy",
    keys = {},
    opts = {},
    config = function(_, opts)
      require("mini.visits").setup(opts)
    end,
  }
}
