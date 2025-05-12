return {
  "nvim-pack/nvim-spectre",
  opts = {
    mapping = {
      ["close_spectre"] = {
        map = "<leader>q",
        cmd = "<cmd>q!<cr>",
        desc = "Close spectre",
      },
      ["send_to_qf"] = {
        map = "<leader>T",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix",
      },
    },
  },
  keys = {
    {
      "<leader>S",
      '<cmd>lua require("spectre").toggle()<CR>',
      desc = "Toggle Spectre",
    },
    {
      "<leader>W",
      '<esc><cmd>lua require("spectre").open_visual()<CR>',
      mode = { "v" },
      desc = "Toggle Spectre",
    },
  },
}

-- vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
-- desc = "Search current word"
-- })
