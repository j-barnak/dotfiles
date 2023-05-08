return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp"
  },
  event = "VeryLazy",
  config = function()
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
    require("nvim-autopairs").setup {}
  end
}
-- return {
--   "echasnovski/mini.pairs",
--   event = "VeryLazy",
--   config = function(_, opts)
--     require("mini.pairs").setup(opts)
--   end,
-- }
