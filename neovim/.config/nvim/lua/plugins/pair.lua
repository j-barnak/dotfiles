return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp"
  },
  event = "VeryLazy",
  config = function()
    --
    local handlers = require('nvim-autopairs.completion.handlers')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done({
        filetypes = {
          -- "*" is a alias to all filetypes
          ["*"] = {
            ["("] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method,
              },
              handler = handlers["*"]
            }
          },
          lua = {
            ["("] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method
              },
              ---@param char string
              ---@param item table item completion
              ---@param bufnr number buffer number
              ---@param rules table
              ---@param commit_character table<string>
              handler = function(char, item, bufnr, rules, commit_character)
                -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr, rules, commit_character})
              end
            }
          },
        }
      })
    )
    --
    require("nvim-autopairs").setup {}
  end
}
