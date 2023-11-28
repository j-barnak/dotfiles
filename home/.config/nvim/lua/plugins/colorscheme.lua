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
    vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#EBCB8B", bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "#242933" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#ECEFF4", bg = "#242933", bold = true })
    -- -- Fixes Searchbox
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "TelescopeBorder" })
    vim.api.nvim_set_hl(0, "FloatTitle", { link = "TelescopeTitle" })
    -- Fixes LSP highlighting
    vim.api.nvim_set_hl(0, "@lsp.type.operator.cpp", {})
  end,
}
