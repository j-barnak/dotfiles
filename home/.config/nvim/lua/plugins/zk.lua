return {
  "mickael-menu/zk-nvim",
  opts = {},
  config = function(_, opts)
    require("zk").setup(opts)
  end,
}
