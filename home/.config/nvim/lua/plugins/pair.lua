return {
  {
    "windwp/nvim-autopairs",
    dependencies = {
      { "hrsh7th/nvim-cmp" },
    },
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      local npairs = require("nvim-autopairs")
      local rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      npairs.setup(opts)

      local is_template = require("util.pair").is_template
      local struct_or_class = require("util.pair").struct_or_class

      npairs.add_rules({
        rule("<", ">"):with_pair(cond.none()):with_move(cond.done()):use_key(">"),
        rule("{", "};", { "cpp", "c" }):with_pair(struct_or_class),
      })

      vim.keymap.set("i", "<", is_template)
    end,
  },
}
