return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    messages = {
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
    },
    popupmenu = { enabled = false },
    notify = {
      enabled = true,
      view = "mini",
    },
    lsp = {
      signature = {
        auto_open = {
          trigger = false,
        },
      },
      documentation = { enabled = false },
      message = {
        view = "mini",
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
}
