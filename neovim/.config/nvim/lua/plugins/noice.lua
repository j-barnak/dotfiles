return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    popupmenu = {
      enabled = true,
    },
    notify = {
      enabled = true,
    },
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
      documentation = {
        enabled = false,
      },
    },
  },
}
