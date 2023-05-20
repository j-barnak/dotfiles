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
    "MattesGroeger/vim-bookmarks",
    "tom-anders/telescope-vim-bookmarks.nvim",
    {
      "ecthelionvi/NeoComposer.nvim",
      dependencies = { "kkharji/sqlite.lua" },
      opts = {},
    },
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
    {
      "<leader>dd",
      "<cmd>BookmarkClearAll<cr>",
      desc = "Remove all bookmarks",
    },
    {
      "<leader>;",
      "<cmd>Telescope vim_bookmarks<cr>",
      desc = "View bookmarks",
    },
    {
      "<leader>q",
      "<cmd>Telescope macros<cr>",
      desc = "View Macros",
    },
    {
      "<leader>db",
      "<cmd>ClearNeoComposer<cr>",
      desc = "Remove all bookmarks",
    },
  },
  config = function()
    local opts = {
      extensions = {
        undo = {
          mappings = {
            i = {
              ["<s-cr>"] = require("telescope-undo.actions").yank_additions,
              ["<c-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
          },
        },
      },
    }

    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("aerial")
    require("telescope").load_extension("projects")
    require("telescope").load_extension("undo")
    require("telescope").load_extension("vim_bookmarks")
  end,
}
