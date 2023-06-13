return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "stevearc/aerial.nvim",
    "MattesGroeger/vim-bookmarks",
    "tom-anders/telescope-vim-bookmarks.nvim",
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
      "<leader>dd",
      "<cmd>BookmarkClearAll<cr>",
      desc = "Remove all bookmarks",
    },
    {
      "<leader>;",
      "<cmd>Telescope vim_bookmarks<cr>",
      desc = "View bookmarks",
    },
  },
  opts = {},
  config = function()
    -- require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("aerial")
    require("telescope").load_extension("vim_bookmarks")
  end,
}
