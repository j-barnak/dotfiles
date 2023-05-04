return {
  "echasnovski/mini.starter",
  version = false,
  -- 	opts = {
  --       evaluate_single = true,
  -- 	header = table.concat({
  -- 		[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
  -- 		[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
  -- 		[[/ /\  /  __/ (_) \ V /| | | | | | |]],
  -- 		[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
  -- 		[[───────────────────────────────────]],
  -- 	}, "\n"),
  -- 	query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
  -- })

  -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
  -- started with intent to show something else.
  opts = {
    -- Whether to evaluate action of single active item
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
      { action = "Open Projects", name = "Telescope projects", section = "Telescope" },
    },
  },

  -- Whether to disable showing non-error feedback
  config = function()
    require("mini.starter").setup()
  end,
}
