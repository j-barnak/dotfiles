return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cmd = { "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	config = true,
	opts = {
		signs = false,
		keywords = {
			FIX = {
				color = "#56B6C2",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { color = "#C678DD" },
		},
	},
	keys = {
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },
	},
}
