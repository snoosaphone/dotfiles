return {
    'L3MON4D3/LuaSnip',
    config = function()
        local ls = require('luasnip')
        local extras = require('luasnip.extras')
        local l = extras.lambda
        ls.setup({
            snip_env = {
                s = function(...)
                    local snip = ls.s(...)
                    table.insert(getfenv(2).ls_file_snippets, snip)
                end,
                parse = function(...)
                    local snip = ls.parser.parse_snippet(...)
                    table.insert(getfenv(2).ls_file_snippets, snip)
                end,
            },
        })
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_lua').lazy_load({paths = "./snippets"})
    end,
    dependencies = {
        'saadparwaiz1/cmp_luasnip', -- Wrapper to load snippets in nvim-cmp
        'rafamadriz/friendly-snippets',
    },
}
