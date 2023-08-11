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
        -- TODO: There's an issue surrounding this porblem described here. What I have is considered a workaround,
        --       but frankly, it doesn't seem like an issue and achieves what I want well. If I find out there's an
        --       issue, I could change it back to:
        --
        --      cpp = { defaults.clangformat },
        --      c = { defaults.clangformat },
        --
        -- stylua: ignore start
        racket = { vim.lsp.buf.format },
        cpp = { vim.lsp.buf.format },
        c = { vim.lsp.buf.format },
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
