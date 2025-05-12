return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>l", "<cmd>LazyGit<cr>" },
	},
	config = function()
		require("telescope").load_extension("lazygit")
	end,
}
