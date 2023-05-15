return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = false,
    config = function()
      require("lsp-zero.settings").preset({})
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      require("lsp-zero.cmp").extend()

      local cmp = require("cmp")

      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item(select_opts),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(select_opts),
          ["<cr>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
        },
      })
    end,
  },

  -- LSP + Trouble
  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "jose-elias-alvarez/null-ls.nvim" },
      { "folke/trouble.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
    },

    config = function()
      -- Trouble diagnostics keymap
      local trouble_opts = {
        action_keys = {
          jump = {},
          jump_close = { "<cr>" },
        },
      }

      require("trouble").setup(trouble_opts)
      vim.keymap.set("n", "<leader>b", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

      local lsp = require("lsp-zero")

      -- stylua: ignore start
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, remap = false }
        local additional_opts = { buffer = bufnr, remap = false, silent = true }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>rr', function() require('telescope.builtin').lsp_references() end, additional_opts)
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
      end)

      -- Configure Language Servers Here
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      require('lspconfig').clangd.setup({
        cmd = {
          'clangd',
          '--background-index',
          '--clang-tidy'
        }
      })

      lsp.setup()

      lsp.format_on_save({
        format_opts = {
          async = true,
          timeout_ms = 10000,
        },
        servers = {
          ['null-ls'] = {'lua', 'javascript', 'typescript'},
          ['clangd']  = {'cpp', 'c'}
        }
      })

      local null_ls = require('null-ls')

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.stylua,
        },
      })
    end,
  },
}
