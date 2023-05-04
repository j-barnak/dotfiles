return {
  "echasnovski/mini.starter",
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
      { name = "Open Projects", action = "Telescope projects", section = "Telescope" },
    },
  },
  config = function(_, opts)
    require("mini.starter").setup(opts)
  end,
}
