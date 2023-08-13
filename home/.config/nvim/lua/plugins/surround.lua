-- TODO: - Setup the key maps to use lazy.nvim `keys` and set event to VeryLazy
return {
  "echasnovski/mini.surround",
  lazy = false,
  version = "*",
  config = function()
    require("mini.surround").setup()
    vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
  end,
}
