return {
	"MeanderingProgrammer/harpoon-core.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
    -- stylua: ignore start
    { "<leader>a", function () require("harpoon-core.mark").add_file() end },
    { "<leader>e", function () require("harpoon-core.ui").toggle_quick_menu() end },
    { "<leader>1", function () require("harpoon-core.ui").nav_file(1)  end },
    { "<leader>2", function () require("harpoon-core.ui").nav_file(2)  end },
    { "<leader>3", function () require("harpoon-core.ui").nav_file(3)  end },
    { "<leader>4", function () require("harpoon-core.ui").nav_file(4)  end },
    { "<Tab>", function () require('harpoon-core.ui').nav_next() end },
    { "<S-Tab>", function () require('harpoon-core.ui').nav_prev() end },
		-- stylua: ignore end
	},
	opts = {},
	config = function(_, opts)
		require("harpoon-core").setup(opts)
	end,
}
