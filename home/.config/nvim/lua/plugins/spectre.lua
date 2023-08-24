return {
  "nvim-pack/nvim-spectre",
  opts = {
    mapping = {
      ["close_spectre"] = {
        map = "Q",
        cmd = "<cmd>q!<cr>",
        desc = "Close spectre",
      },
    },
  },
  keys = {
    { "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
  },
}
