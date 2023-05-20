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
  opts = {
    -- defines iB/aB as a textobject
    -- Will selesct evrything within the buffer
    custom_textobjects = {
      f = false,
      B = function(ai_type)
        local n_lines = vim.fn.line("$")
        local start_line, end_line = 1, n_lines
        if ai_type == "i" then
          -- Skip first and last blank lines fori` textobject
          local first_nonblank, last_nonblank = vim.fn.nextnonblank(1), vim.fn.prevnonblank(n_lines)
          start_line = first_nonblank == 0 and 1 or first_nonblank
          end_line = last_nonblank == 0 and n_lines or last_nonblank
        end

        local to_col = math.max(vim.fn.getline(end_line):len(), 1)
        return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
      end,
    },
  },
  config = function(_, opts)
    require("mini.ai").setup(opts)
  end,
}
