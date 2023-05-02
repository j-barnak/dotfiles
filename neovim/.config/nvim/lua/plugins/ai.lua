return {
    "echasnovski/mini.ai",
    keys = {
        { "a", mode = { "x", "o" } },
        { "i", mode = { "x", "o" } },
    },
    event = "VeryLazy",
    dependencies = { "nvim-treesitter-textobjects" },
    config = function(_, opts)
        require("mini.ai").setup(opts)
    end,
}
