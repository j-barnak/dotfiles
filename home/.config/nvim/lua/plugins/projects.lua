return {
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
  "coffebar/neovim-project",
  keys = {
    {
      "<leader>fp",
      "<cmd>Telescope neovim-project history<CR>",
      desc = "Find Files",
    }
  },
  opts = {
    projects = { -- define project roots
      "~/Projects/*",
      "~/Obsidian/*",
      "~/.config/nvim/"
    },
  },
  init = function()
  -- enable saving the state of plugins in the session
  vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
}
