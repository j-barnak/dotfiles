return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "stevearc/aerial.nvim",
    "ahmedkhalf/project.nvim",
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
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Find recent files",
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
      "<leader>fp",
      "<cmd>Telescope projects<cr>",
      desc = "Find projects",
    },
    {
      "<leader>fu",
      "<cmd>Telescope undo<cr>",
      desc = "View undos",
    },
  },
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("aerial")
    require('telescope').load_extension('projects')
    require("telescope").load_extension("undo")
  end,
}
