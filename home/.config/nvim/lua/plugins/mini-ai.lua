return {
  "echasnovski/mini.ai",
  keys = {
    { "a", mode = { "x", "o" } },
    { "i", mode = { "x", "o" } },
  },
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      opts = {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["ik"] = "@block.inner",
              ["ak"] = "@block.outer",
            },
          },
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function(_, opts)
    require("mini.ai").setup(opts)
  end,
}
