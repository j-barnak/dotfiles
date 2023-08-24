return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      multi_window = false,
    },
    modes = {
      char = {
        jump_labels = true,
        keys = { "t", "T", ";", "," },
      },
    },
    prompt = {
      prefix = { { "Flash: ", "FlashPromptIcon" } },
    },
  },
  keys = {
    {
      "f",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump({
          search = { forward = true, wrap = false, multi_window = false },
        })
      end,
    },
    {
      "F",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump({
          search = { forward = false, wrap = false, multi_window = false },
        })
      end,
    },
    {
      "s",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "<S-Space>",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}
