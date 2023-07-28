return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "frappe", -- latte, frappe, macchiato, mocha
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
    vim.cmd("highlight! link Todo Comment") -- Must be after colorscheme
  end,
}
