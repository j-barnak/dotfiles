local M = {}

-- TODO: Put all the LSP configs here
function M.serenity()
  require("lspconfig").clangd.setup({
    on_attach = require("lsp-format").on_attach,
    cmd = {
      "clangd",
      "--background-index",
      "--query-driver=/home/jared/Projects/serenity/Toolchain/Local/**/*",
      "--header-insertion=never",
    },
  })
end

return M
