return {
    {
        'kylechui/nvim-surround',
        version = '*',
    },
    { 'smjonas/inc-rename.nvim' },
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
    { 'tpope/vim-fugitive' },
    { 'windwp/nvim-autopairs', },
}
