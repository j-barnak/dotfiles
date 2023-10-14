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
      local semicolon = require("util.pair").struct_class_semicolon

      npairs.add_rules({
        rule("<", ">"):with_pair(cond.none()):with_move(cond.done()):use_key(">"),
      })

      npairs.add_rules({
        rule("{", "};", { "cpp", "c" }):with_pair(semicolon),
      })

      vim.keymap.set("i", "<", is_template)
    end,
  },
}
