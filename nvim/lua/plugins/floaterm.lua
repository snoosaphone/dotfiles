return {
    'voldikss/vim-floaterm',
    keys = {
        { 't', ':FloatermToggle myfloat<CR>' },
        { '<ESC>', '<C-\\><C-n>:q<CR>', mode = 't' },
    },
    lazy = false,
}
