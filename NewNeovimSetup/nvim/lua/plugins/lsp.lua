return {
{
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local lspconfig = require('lspconfig')
        local builtin = require("telescope.builtin")

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('i', '<C-i>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>rr', builtin.lsp_references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })

        lspconfig.clangd.setup({
            cmd = {
                "clangd",
                "--background-index",
                "--header-insertion=never",
            },
        })

       lspconfig.lua_ls.setup({})

    end
},
}

