local root_str = { "stylua.lua", ".git", ".clang-format", "pyproject.toml", "setup.py", ".obsidian" }
local root_dir = vim.fs.dirname(vim.fs.find(root_str, { upward = true })[1])

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "stevearc/aerial.nvim",
  },
  keys = {
    {
      "<leader>fs",
      "<cmd>Telescope aerial<cr>",
      desc = "Find symbols",
    },
  },
  opts = {},
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("aerial")
  end,
}
