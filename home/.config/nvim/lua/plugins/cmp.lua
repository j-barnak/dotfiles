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
  opts = function()
    local cmp = require("cmp")
    return {
      completion = {
        completeopt = "noselect",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
      }),
      sources = cmp.config.sources({
    {name = "nvim_lsp"}, 
    {name = "luasnip"}, 
    {name = "path"}}, 
    {
        {name = "buffer"}
    })
    }
  end,
  config = function(_, opts)
    require("cmp").setup(opts)
    vim.keymap.set("i", "<S-CR>", "<cmd>lua require'luasnip'.jump(1)<CR>", { noremap = true, silent = true })
  end,
}
