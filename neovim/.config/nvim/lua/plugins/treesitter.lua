return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  lazy = false,
  config = function()
    local options = {
      ensure_installed = {
        "c",
        "lua",
        "javascript",
        "cpp",
        "typescript",
        "vim",
        "html",
        "css",
        "bash",
        "vimdoc",
        "query",
      },
      -- ignore_install = { "comment" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        -- disable treesitter for large files
        disable = function(lang, bufnr) --
          -- Extend this to other languages by adding `lang == "x"` where x is the language
          return vim.api.nvim_buf_line_count(bufnr) > 50000 and (lang == "cpp" or lang == "c")
        end,
        additional_vim_regex_highlighting = false,
      },
    }
    require("nvim-treesitter.configs").setup(options)
    -- This fixes the ugly yellow highlighting in TODO
    vim.api.nvim_set_hl(0, "@text.todo", {})
  end,
}
