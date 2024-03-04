return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup {
            tabline = {
                lualine_a = {
                    'tabs',
                },
                lualine_z = {
                    'buffers',
                }
            }
        }
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
}
