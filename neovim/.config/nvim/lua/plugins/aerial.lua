return {
  "stevearc/aerial.nvim",
  opts = {
    layout = {
      min_width = 25,
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    vim.cmd('nmap <silent> <leader>ds <cmd>call aerial#fzf()<cr>')
    
  end
}
