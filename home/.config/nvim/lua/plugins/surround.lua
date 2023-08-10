-- TODO: - Setup the key maps to use lazy.nvim `keys` and set event to VeryLazy
--       - Using `]` doesn't add a space when surrounding. Make it alias to `[`
return {
  "echasnovski/mini.surround",
  lazy = false,
  version = "*",
  config = function()
    require("mini.surround").setup()
    vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
  end,
}
