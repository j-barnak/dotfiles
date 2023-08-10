return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    delay = 0,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
  },
  config = function(_, opts)
    local illuminate = require("illuminate")
    illuminate.configure(opts)
  end,
}
