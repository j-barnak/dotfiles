-- TODO: Laz-ify this
return {
  "nvim-pack/nvim-spectre",
  config = function()
    require("spectre").setup({
      mapping = {
        ["close_spectre"] = {
          map = "<leader>q",
          cmd = "<cmd>q!<cr>",
          desc = "Close spectre",
        },
        -- you can put your mapping here it only use normal mode
      },
    })
    vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre",
    })
  end,
}
