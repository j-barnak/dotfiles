return {
	"echasnovski/mini.statusline",
	version = false,
	opts = {},
	config = function(_, opts)
		require("mini.statusline").setup(opts)
		vim.o.cmdheight = 0
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = "#2e3440" })
	end,
}
