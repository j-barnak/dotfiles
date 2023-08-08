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

    local illuminate_group = vim.api.nvim_create_augroup("IlluminateBufUpdate", { clear = true })
    vim.api.nvim_create_autocmd("BufEnter", {
      group = illuminate_group,
      callback = illuminate.resume_buf,
    })
    vim.api.nvim_create_autocmd("BufLeave", {
      group = illuminate_group,
      callback = illuminate.pause_buf,
    })

    vim.keymap.del({ "o", "x" }, "<M-i>")
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = false })
  end,
}
