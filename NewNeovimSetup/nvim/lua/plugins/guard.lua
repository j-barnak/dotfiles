return {
	"https://github.com/nvimdev/guard.nvim",
	opts = {
		fmt_on_save = true,
	},
	config = function(_, opts)
		local ft = require("guard.filetype")

		ft("c"):fmt("clang-format")
		ft("lua"):fmt("stylua")
		ft("typescript,javascript,typescriptreact"):fmt("prettierd")

		require("guard").setup(opts) -- Must be called last
	end,
}
