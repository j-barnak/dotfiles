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
  keys = {
    {
      "<S-CR>",
      function()
        require("luasnip").jump(1)
      end,
      mode = { "i" },
      silent = true,
      remap = false,
    },
  },
  opts = function()
    local cmp = require("cmp")

    local entry_filter_fn = function()
      local context = require("cmp.config.context")
      return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
    end

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
        {
          name = "nvim_lsp",
          entry_filter = entry_filter_fn,
        },
        {
          name = "luasnip",
          entry_filter = entry_filter_fn,
        },
        {
          name = "path",
          entry_filter = entry_filter_fn,
        },
      }, {
        {
          name = "buffer",
          entry_filter = entry_filter_fn,
        },
      }),
    }
  end,
}
