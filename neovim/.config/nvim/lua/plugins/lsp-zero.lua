-- TODO: Add <leader>cd to view errors/warnings on the line
--       Potentially use the line plugin to fix it
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
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
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
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- ['<CR>'] = cmp.mapping.confirm({ select = false })
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      }
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
      { "jay-babu/mason-null-ls.nvim" },
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        keys = {
          { "<leader>nv", "<cmd>Navbuddy<cr>", desc = "Navigation Buddy" },
        },
        opts = { lsp = { auto_attach = true } },
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
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() require("telescope.builtin").lsp_references() end, additional_opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>s", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)
      -- stylua: ignore end

      -- Configure Language Servers Here
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

      require("lspconfig").clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },
      })

      lsp.setup()

      lsp.format_on_save({
        format_opts = {
          async = true,
          timeout_ms = 10000,
        },
        servers = {
          ["null-ls"] = { "lua", "javascript", "typescript" },
          ["clangd"] = { "cpp", "c" },
        },
      })

      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
      })
    end,
  },
  -- LSP Saga
  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    event = "LspAttach",
    config = function()
      local opts = {
        finder = {
          keys = {
            expand_or_jump = "<cr>",
          },
        },
        beacon = {
          enable = false,
          frequency = 7,
        },
        ui = {
          -- This option only works in Neovim 0.9
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "",
          incoming = " ",
          outgoing = " ",
          hover = "",
          kind = {},
        },
      }
      require("lspsaga").setup(opts)
      local keymap = vim.keymap.set
      keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
      keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
      keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
    end,
  },
}
