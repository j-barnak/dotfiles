-- NOTE: LSPs that handle formatting are configured in `lsp.lua` (where nvim-lspconfig). Tracking
--       an issue where `formatter.nvim` does not hanve `vim.lsp.buf.format` well.
--       https://github.com/mhartington/formatter.nvim/issues/260
return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require("formatter.util")
    local defaults = require("formatter.defaults")

    require("formatter").setup({
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
          function()
            return {
              exe = "stylua",
              args = {
                "--search-parent-directories",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--",
                "-",
              },
              stdin = true,
            }
          end,
        },
        racket = { vim.lsp.buf.format },
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
      command = "FormatWrite",
    })
  end,
}
