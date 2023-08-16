return {
  "creativenull/efmls-configs-nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "lukas-reineke/lsp-format.nvim" },
    { "neovim/nvim-lspconfig" },
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local builtin = require("telescope.builtin")
    local efmls = require("efmls-configs")
    local prettier_d = require("efmls-configs.linters.eslint_d")
    local eslint_d = require("efmls-configs.formatters.prettier_d")
    local stylua = require("efmls-configs.formatters.stylua")
    local smlfmt = require("efmls-configs.formatters.smlfmt")

    efmls.init({
      init_options = {
        documentformatting = true,
      },
    })

    efmls.setup({
      javascript = {
        linter = eslint_d,
        formatter = prettier_d,
      },
      lua = {
        formatter = stylua,
      },
      sml = {
        formatter = smlfmt.formatCommand,
      },
    })

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

    lspconfig.millet.setup({
      filetype = { "sml" },
      -- on_attach = require("lsp-format").on_attach,
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

    lspconfig.efm.setup({
      filetypes = { "typescript", "javascript", "lua", "yaml", "sml" },
      on_attach = require("lsp-format").on_attach,
      init_options = { documentformatting = true },
      settings = {
        languages = {
          typescript = { prettier_d },
          yaml = { prettier_d },
          lua = { stylua },
          sml = { smlfmt },
        },
      },
    })

    -- Test autoformat
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      callback = function()
        -- Files handled by `lsp-format`
        local ft = vim.bo.filetype
        if ft == "sml" then
          vim.cmd("write!")
          vim.lsp.buf.format()
        end
      end,
    })
  end,
}
