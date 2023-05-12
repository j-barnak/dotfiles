return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = false,
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

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
					["<Tab>"] = cmp.mapping.select_next_item(elect_opts),
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
					jump_close = { "<cr>", "o" },
				},
			}

			require("trouble").setup(trouble_opts)
			vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

			local lsp = require("lsp-zero")

      -- stylua: ignore start
      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, remap = false }
        local additional_opts = { buffer = bufnr, remap = false, silent = true }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() require('telescope.builtin').lsp_references() end, additional_opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)

      -- Configure Language Servers Here
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      require('lspconfig').clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy"
        }
      })

      lsp.setup()

      -- null-ls config
      local async_formatting = function(bufnr)
        bufnr = bufnr or vim.api.nvim_get_current_buf()

        vim.lsp.buf_request(
          bufnr,
          "textDocument/formatting",
          vim.lsp.util.make_formatting_params({}),
          function(err, res, ctx)
            if err then
              local err_msg = type(err) == "string" and err or err.message
              -- you can modify the log message / level (or ignore it completely)
              vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
              return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
              return
            end

            if res then
              local client = vim.lsp.get_client_by_id(ctx.client_id)
              vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
              vim.api.nvim_buf_call(bufnr, function()
                vim.cmd("silent noautocmd update")
              end)
            end
          end
        )
      end

      local null_ls = require("null-ls")

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        sources = {
          -- Add null-ls sources here
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.stylua,
        },
        debug = false,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePost", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                async_formatting(bufnr)
              end,
            })
          end
        end,
      })
		end,
	},
}
