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
    "debugloop/telescope-undo.nvim",
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<CR>",
      desc = "Find Files",
    },
    {
      "<leader>fg",
      "<cmd> Telescope live_grep<CR>",
      desc = "Grep all files",
    },
    {
      "<leader>fd",
      "<cmd>Telescope git_files<cr>",
      desc = "Find project files",
    },
    {
      "<leader>fs",
      "<cmd>Telescope aerial<cr>",
      desc = "Find symbols",
    },
    {
      "<leader>fS",
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      desc = "Find workspace symbols",
    },
    {
      "<leader>fu",
      "<cmd>Telescope undo<cr>",
      desc = "Find symbols",
    },
  },
  opts = {},
  config = function()
    require("telescope").setup(opts)

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("aerial")
    require("telescope").load_extension("undo")
  end,
}
