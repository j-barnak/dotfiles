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
        -- stylua: ignore start
        javascript = { function() return { prettierd = util.copyf(defaults.prettierd), } end, },
        html = { function() return { prettierd = util.copyf(defaults.prettierd), } end, },
        cpp = { function() return { clangformat = util.copyf(defaults.clangformat), } end, },
        c = { function() return { clangformat = util.copyf(defaults.clangformat), } end, },
        -- stylua: ignore end
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })

    vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = "FormatAutogroup",
      command = "FormatWrite",
    })
  end,
}
