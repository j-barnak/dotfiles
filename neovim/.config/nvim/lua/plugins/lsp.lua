return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup()
    end,
  },

  --  TODO: Configure null-ls and mason-null-ls here
  --        You'll have to move some stuff away from lsp-config
  --        This may have to be after lsp-config
  {},

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.stylua,
        },
      })

      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
          filter = function(client)
            local filetype = vim.api.nvim_buf_get_option(0, "filetype")
            if filetype == "cpp" or "c" then
              return client.name == "clangd"
            end

            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
      })

      lspconfig.clangd.setup({
        on_attach = on_attach,
      })
    end,
  },
}
