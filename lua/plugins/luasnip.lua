return {
    'L3MON4D3/LuaSnip',
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
    end,
    dependencies = {
        'saadparwaiz1/cmp_luasnip', -- Wrapper to load snippets in nvim-cmp
        'rafamadriz/friendly-snippets',
    },
}
