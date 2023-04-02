local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local luasnip = require('luasnip')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

cmp.setup({
  snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    ['<Enter>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})


lsp.setup()
