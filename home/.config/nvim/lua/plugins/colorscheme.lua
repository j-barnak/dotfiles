return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "frappe",
    integrations = {
      telescope = {
        enabled = true,
        -- style = "nvchad",
      },
      hop = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
    vim.cmd("highlight! link Todo Comment") -- Must be after colorscheme
  end,
}
-- return {
--   "AlexvZyl/nordic.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nordic").setup({
--       telescope = { style = "classic" },
--     })
--     require("nordic").load()
--   end,
-- }
