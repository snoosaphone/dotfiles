return {
    'hrsh7th/nvim-cmp',
    config = function()
        local cmp = require('cmp')
        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            experimental = {
                ghost_text = true,
            },
            mapping = {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-j>'] = cmp.mapping.scroll_docs(-4),
                ['<C-k>'] = cmp.mapping.scroll_docs(4),
                ['<C-space>'] = cmp.mapping.complete(),
                ['<C-y>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
            },
            formatting = {
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        buffer = '[Buf]',
                        luasnip = '[Snips]',
                        nvim_lsp = '[LSP]',
                        nvim_lua = '[Lua]',
                    })[entry.source.name]
                    return vim_item
                end,
                field = { 'abbr', 'kind', 'menu' }
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            }, {
                { name = 'buffer' },
            })
        }

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'buffer' },
            }, {
                { name = 'cmdline' },
            })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
    end,
    dependencies = {
        {
            'hrsh7th/cmp-nvim-lsp',
            lazy = false,
        },
        {
            'hrsh7th/cmp-buffer',
            lazy = false,
        },
        {
            'hrsh7th/cmp-path',
            lazy = false,
        },
        {
            'hrsh7th/cmp-cmdline',
            lazy = false,
        },
        {
            'L3MON4D3/LuaSnip',
            lazy = false,
        },
    },
    event = 'InsertEnter',
    lazy = false,
}
