return {
  "chentoast/marks.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    default_mappings = false,
    mappings = {
      set_next = ";;",
      toggle = ";<Space>",
      delete_line = ";d",
      annotate = ";f",
    },
  },
  keys = {
    {
      "<leader>f;",
      function()
        require("telescope.builtin").marks()
      end,
    },
  },
}
