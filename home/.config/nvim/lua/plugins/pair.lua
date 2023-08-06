return {
	"echasnovski/mini.pairs",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	event = "VeryLazy",
	config = function()
		require("mini.pairs").setup()
		require("mini.pairs").map(
			"i",
			"<",
			{ action = "open", pair = "<>", neigh_pattern = "\r.", register = { cr = false } }
		)
		require("mini.pairs").map("i", ">", { action = "close", pair = "<>", register = { cr = false } })
	end,
}
