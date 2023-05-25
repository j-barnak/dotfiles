return {
  "echasnovski/mini.starter",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  version = false,
  opts = {
    evaluate_single = true,
    header = table.concat({
      "██████╗  █████╗ ██████╗ ███╗   ██╗ █████╗ ██╗  ██╗",
      "██╔══██╗██╔══██╗██╔══██╗████╗  ██║██╔══██╗██║ ██╔╝",
      "██████╔╝███████║██████╔╝██╔██╗ ██║███████║█████╔╝ ",
      "██╔══██╗██╔══██║██╔══██╗██║╚██╗██║██╔══██║██╔═██╗ ",
      "██████╔╝██║  ██║██║  ██║██║ ╚████║██║  ██║██║  ██╗",
      "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝",
    }, "\n"),
    footer = os.date(),
    items = {
      { name = "Open projects", action = "Telescope projects", section = "=== Actions ===" },
      { name = "Search project files", action = "Telescope git_files", section = "=== Actions ===" },
      { name = "Find files", action = "Telescope find_files", section = "=== Actions ===" },
      { name = "Grep text", action = "Telescope live_grep", section = "=== Actions ===" },
      { name = "Recent files", action = "Telescope oldfiles", section = "=== Actions ===" },
      { name = "New file", action = "ene | startinsert", section = "=== Actions ===" },
      { name = "Lazy", action = "Lazy", section = "=== Actions ===" },
      { name = "Planets!", action = "Telescope planets", section = "=== Actions ===" },
      { name = "Quit", action = "qa", section = "=== Actions ===" },
    },
  },
  config = function(_, opts)
    require("mini.starter").setup(opts)
  end,
}
