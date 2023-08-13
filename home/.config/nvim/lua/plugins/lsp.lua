return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local builtin = require("telescope.builtin")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>rr", builtin.lsp_references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })

      -- Server setup here
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      lspconfig.emmet_language_server.setup({})
      lspconfig.tsserver.setup({})

      lspconfig.racket_langserver.setup({})

      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--all-scopes-completion",
          "--background-index",
          "--clang-tidy",
          "--cross-file-rename",
          "--header-insertion=never",
        },
      })

      lspconfig.lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                library = { vim.env.VIMRUNTIME },
              },
            })
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end,
      })
    end,
  },
}
