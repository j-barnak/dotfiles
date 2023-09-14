return {
  "creativenull/efmls-configs-nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "lukas-reineke/lsp-format.nvim" },
    { "neovim/nvim-lspconfig" },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local builtin = require("telescope.builtin")

    local languages = {
      html = {
        require("efmls-configs.formatters.prettier_d"),
      },
      javascript = {
        require("efmls-configs.linters.eslint_d"),
        require("efmls-configs.formatters.prettier_d"),
      },
      lua = {
        require("efmls-configs.formatters.stylua"),
      },
      sml = {
        require("efmls-configs.formatters.smlfmt"),
      },
    }

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { ".git/" },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }

    require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
      on_attach = require("lsp-format").on_attach,
    }))

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
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

    lspconfig.millet.setup({
      filetype = { "sml" },
    })

    lspconfig.racket_langserver.setup({
      on_attach = require("lsp-format").on_attach,
    })

    lspconfig.clangd.setup({
      on_attach = require("lsp-format").on_attach,
      cmd = {
        "clangd",
        "--all-scopes-completion",
        "--background-index",
        "--cross-file-rename",
        "--header-insertion=never",
      },
    })
    -- end

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
}
