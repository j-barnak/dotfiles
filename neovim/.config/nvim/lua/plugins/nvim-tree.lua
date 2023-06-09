return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree", { silent = true, noremap = true } },
  },

  opts = {
    actions = { open_file = { quit_on_open = true } },
  },
  config = function(_, opts)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
      pattern = "NvimTree_*",
      callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if
          layout[1] == "leaf"
          and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
          and layout[3] == nil
        then
          vim.cmd("confirm quit")
        end
      end,
    })

    require("nvim-tree").setup(opts)
  end,
}
