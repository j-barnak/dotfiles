-- NOTE: LSPs that handle formatting are configured in `lsp.lua` (where nvim-lspconfig). Tracking
--       an issue where `formatter.nvim` does not support `vim.lsp.buf.format`.
--       https://github.com/mhartington/formatter.nvim/issues/260
return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require("formatter.util")
    local defaults = require("formatter.defaults")

    require("formatter").setup({
      filetype = {
        lua = { require("formatter.filetypes.lua").stylua },
        -- racket = { vim.lsp.buf.format },
        javascript = { defaults.prettierd },
        typescript = { defaults.prettierd },
        html = { defaults.prettierd },
        -- stylua: ignore end
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })

    -- Format After Save
    vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = "FormatAutogroup",
      callback = function()
        local ft = vim.bo.filetype
        -- Files handled by `lsp-format`
        if (ft ~= "c") and (ft ~= "cpp") and (ft ~= "racket") then
          vim.cmd("FormatWrite")
        end
      end,
    })
  end,
}
