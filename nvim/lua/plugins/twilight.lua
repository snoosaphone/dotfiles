return {
    'folke/twilight.nvim',
    config = function ()
        require('twilight').setup({
            dimming = {
                alpha = 0.3,
            },
            expand = {
                "function",
                "method",
                "table",
            }
        })
    end,
    keys = {
        { '<leader>f', ':Twilight<CR>' }
    }
}
