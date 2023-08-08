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
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        -- TODO: See if I need `lang`
        --       if so, do I still need the args?
        disable = function(lang, bufnr) --
          return vim.api.nvim_buf_line_count(bufnr) > 50000 and (lang == "cpp" or lang == "c" or lang == "javascript")
        end,
        additional_vim_regex_highlighting = false,
      },
    }
    require("nvim-treesitter.configs").setup(options)
    vim.api.nvim_set_hl(0, "@text.todo", {})
  end,
}
