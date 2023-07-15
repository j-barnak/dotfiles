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
        additional_vim_regex_highlighting = false,
      },
    }
    require("nvim-treesitter.configs").setup(options)
    -- This fixes the ugly yellow highlighting in TODO
    vim.api.nvim_set_hl(0, "@text.todo", {})
  end,
}
