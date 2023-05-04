return {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
  },
  { "saadparwaiz1/cmp_luasnip" },
  { "tpope/vim-fugitive" },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
}
