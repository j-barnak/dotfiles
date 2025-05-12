return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons", "stevearc/aerial.nvim" },
  opts = {
    keymap = {
      fzf = {
        ['tab'] = 'down',
        ['btab'] = 'up',
      },
    },
    files = {
      fd_opts = [[--color=never --hidden --follow
                --type f --exclude .git --exclude exports]],
    },
    grep = {
      rg_opts = [[--color=never --hidden --line-number --no-heading --smart-case
                -g "!.git/*" -g "!exports/*"]],
    },
  },
  config = function(_, opts)
    require('fzf-lua').setup(opts)

    local map = vim.keymap.set
    map("n", "<leader>ff", "<Cmd>FzfLua files<CR>", { desc = "find file" })
    map("n", "<leader>fg", "<Cmd>FzfLua live_grep<CR>", { desc = "live grep" })
    map("n", "<leader>ft", "<Cmd>FzfLua tags<CR>", { desc = "project tags" })
    map("n", "<leader>fb", "<Cmd>FzfLua btags<CR>", { desc = "buffer tags" })
    map("n", "<leader>fd", "<Cmd>FzfLua lsp_definitions<CR>")
    map("n", "<leader>fr", "<Cmd>FzfLua lsp_references<CR>")
    map("n", "<leader>fi", "<Cmd>FzfLua lsp_implementations<CR>")
    map("n", "<leader>fS", "<Cmd>FzfLua lsp_document_symbols<CR>", { desc = "document symbols (LSP)" })
  end,
}
