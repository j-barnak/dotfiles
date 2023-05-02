return {
    {
        'kylechui/nvim-surround',
        version = '*',
    },
    { 'smjonas/inc-rename.nvim' },
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    },
    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp'
    },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    { 'mbbill/undotree' },
    { 'folke/neoconf.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.1',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        }
    },
    { 'navarasu/onedark.nvim' },
    { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } },
    { 'ThePrimeagen/harpoon' },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },
    {
        'debugloop/telescope-undo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim',
        }
    },
    { 'tpope/vim-fugitive' },
    {
        'numToStr/Comment.nvim',
    },

    -- New Snippet

    { 'windwp/nvim-autopairs', },
    { 'stevearc/aerial.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        }
    }
}
