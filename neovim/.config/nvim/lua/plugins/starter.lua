return {
  "echasnovski/mini.starter",
  version = false,
  opts = {
    evaluate_single = false,
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
      { name = "Open Projects",        action = "Telescope projects",   section = "Actions" },
      { name = "Search project files", action = "Telescope git_files",  section = "Actions" },
      { name = "Find files",           action = "Telescope find_files", section = "Actions" },
      { name = "View recent files",    action = "Telescope oldfiles",   section = "Actions" },
      { name = "Planets!",             action = "Telescope planets",    section = "Actions" },
    },

  },
  config = function(_, opts)
    require("mini.starter").setup(opts)
  end,
}