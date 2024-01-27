return {
  "chentoast/marks.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  lazy = false,
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
  config = function(_, opts)
    require("marks").setup(opts)
  end,
}
