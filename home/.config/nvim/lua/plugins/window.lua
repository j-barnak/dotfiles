return {
  "https://gitlab.com/yorickpeterse/nvim-window.git",
  keys = {
    {
      "<leader>w",
      function()
        require("nvim-window").pick()
      end,
      mode = { "n", "x" },
    },
  },
}
