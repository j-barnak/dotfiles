return 
{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'williamboman/mason.nvim',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "jose-elias-alvarez/null-ls.nvim"
    },
    config = function()

    end
}

