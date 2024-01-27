return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
	keys = {
    -- stylua: ignore start
    { "<S-CR>", function() require("luasnip").jump(1) end, mode = { "i" }, silent = true, remap = false, },
    { "<C-CR>", function() require("luasnip").expand() end, mode = { "i" }, silent = true, remap = false, },
		-- stylua: ignore end
	},
	opts = function()
		local cmp = require("cmp")

		local entry_filter_fn = function()
			local context = require("cmp.config.context")
			return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
		end

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
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
				["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Manual }),
			}),
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					entry_filter = entry_filter_fn,
				},
				{
					name = "luasnip",
					entry_filter = entry_filter_fn,
					-- TODO: See if this interferes with an LSP's suggestion of functions
					--       e.g., if recommends a snippet before a function.
					--       So far it's good

					-- We often wanted the snippet rather than the key word, hence higher
					-- priority
					priority = 100,
				},
				{
					name = "path",
				},
			}, {
				{
					name = "buffer",
					entry_filter = entry_filter_fn,
				},
			}),
		}
	end,
}
