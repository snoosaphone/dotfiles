return {
    'renerocksai/telekasten.nvim',
    config = function()
        local home = vim.fn.expand('~/.zettelkasten')
        require('telekasten').setup({
            home                  = home,
            dailies               = home .. '/' .. 'daily',
            weeklies              = home .. '/' .. 'weeklies',
            templates             = home .. '/' .. 'templates',
            template_new_note     = home .. '/' .. 'templates/new_note.md',
            template_new_daily    = home .. '/' .. 'templates/daily.md',
            template_new_weekly   = home .. '/' .. 'templates/weekly.md',
            command_palette_theme = 'ivy',
            show_tags_theme       = 'get_cursor',
            plug_into_calendar    = false,

        })

        -- Color for telekasten syntax
        vim.api.nvim_set_hl(0, 'tkLink', { ctermfg = 72, cterm = { bold = true, underdouble = true }, fg = '#689d6a', bold = true, underdouble = true })
        vim.api.nvim_set_hl(0, 'tkBrackets', { ctermfg = 'gray', fg = 'gray' })
        vim.api.nvim_set_hl(0, 'tkTag', { ctermfg = 'gray', fg = 'gray' })
    end,
    keys = {
        { '<leader>zp', ':Telekasten panel<CR>' },
        { '<leader>zn', ':Telekasten find_notes<CR>' },
        { '<leader>zt', ':Telekasten show_tags<CR>' },
    },
    -- lazy = false
}
