return {
  "echasnovski/mini.statusline",
  version = false,
  opts = {},
  config = function(_, opts)
    require('mini.statusline').setup(opts)
    vim.o.cmdheight = 0
  end
}
