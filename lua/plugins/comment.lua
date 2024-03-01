return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {
            ignore = '^$',
            toggler = {
                line = 'gc',
                block = '<nop>',
            },
        }
    end,
    keys = {
        { '<leader>c', ':norm gcc<CR>' },
        { '<leader>c', ':norm gc<CR>', mode = 'v' },
    }
}
