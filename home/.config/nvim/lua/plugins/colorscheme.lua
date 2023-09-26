-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   opts = {
--     flavour = "frappe",
--     integrations = {
--       telescope = {
--         enabled = true,
--         -- style = "nvchad",
--       },
--       hop = true,
--     },
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--     vim.cmd.colorscheme("catppuccin")
--     vim.cmd("highlight! link Todo Comment") -- Must be after colorscheme
--   end,
-- }
return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      telescope = { style = "classic" },
    })
    require("nordic").load()
    -- Fixes Noice Command Line
    vim.api.nvim_set_hl(0, "NoicePopupBorder", { bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { bg = "#644444" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#EBCB8B", bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#ECEFF4", bg = "#242933", bold = true })
    -- Fixes Searchbox
    -- Hop Search
  end,
}
