return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = {
    completion = {
      completeopt = "noselect",
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = require("cmp").mapping.preset.insert({
      ["<Tab>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior }),
      ["<S-Tab>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior }),
      ["<CR>"] = require("cmp").mapping.confirm({ behavior = require("cmp").ConfirmBehavior.Insert, select = false }),
    }),
    sources = require("cmp").config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
  },
  config = function(_, opts)
    require("cmp").setup(opts)
    vim.keymap.set("i", "<S-CR>", "<cmd>lua require'luasnip'.jump(1)<CR>", { noremap = true, silent = true })
  end,
}
