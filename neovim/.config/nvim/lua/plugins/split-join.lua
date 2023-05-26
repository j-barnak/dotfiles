-- TODO: Implement and put the mini module here
return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  version = false,
  config = function()
    -- Mini.indent_opts
    local indent_opts = {
      draw = {
        delay = 40,
        animation = require("mini.indentscope").gen_animation.none(),
      },
    }
    require("mini.indentscope").setup(indent_opts)
  end,
}
