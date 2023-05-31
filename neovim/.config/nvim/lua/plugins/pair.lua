return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  event = "VeryLazy",
  config = function()
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    require("nvim-autopairs").setup({})

    local autopairs = require("nvim-autopairs")
    local cond = require("nvim-autopairs.conds")
    local Rule = require('nvim-autopairs.rule')
    autopairs.add_rules({
      Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(),
    })
  end,
}
