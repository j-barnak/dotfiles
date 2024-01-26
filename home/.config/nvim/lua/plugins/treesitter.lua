return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	lazy = false,
	opts = {
		indent = { enable = true },
		ensure_installed = {
			"c",
			"lua",
			"javascript",
			"cpp",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(lang, bufnr) --
				return vim.api.nvim_buf_line_count(bufnr) > 50000
					and (lang == "cpp" or lang == "c" or lang == "javascript")
			end,
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		vim.api.nvim_set_hl(0, "@text.todo", {})
	end,
}
