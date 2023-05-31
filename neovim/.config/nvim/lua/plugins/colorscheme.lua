return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      comment = { italic = true },
      keyword = { italic = false }, -- any other keyword
      type = { italic = false }, -- (preferred) int, long, char, etc
      storageclass = { italic = false }, -- static, register, volatile, etc
      structure = { italic = false }, -- struct, union, enum, etc
      parameter = { italic = false }, -- parameter pass in function
      annotation = { italic = false },
      tag_attribute = { italic = false }, -- attribute of tag in reactjs
    },
    filter = "machine",
    override = function(c)
      return {
        Normal = { bg = "#2C2E34" },
        SignColumn = { bg = "#2C2E34" },
        CursorColumn = { bg = "#2C2E34" },
        ColorColumn = { bg = "#2C2E34" },
        LineNr = {
          bg = "#2C2E34",
          fg = c.editorLineNumber.foreground,
        },
        CursorLineNr = {
          bg = "#2C2E34",
          fg = c.editorLineNumber.activeForeground,
          bold = true,
        },
      }
    end,
  },
  -- TODO: Fix
  config = function(_, opts)
    require("monokai-pro").setup(opts)
    vim.cmd([[colorscheme monokai-pro]])
    vim.cmd("highlight! link Todo Comment") -- Must be after colorscheme
    vim.cmd([[hi NvimTreeWinSeparator guifg=#273136 guibg=NONE]]) -- Must be after colorscheme
  end,
}
