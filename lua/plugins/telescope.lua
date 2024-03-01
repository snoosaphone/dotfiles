return {
    'nvim-telescope/telescope.nvim',
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {
                    '.png$',
                    '.jpg$',
                    '.jpeg$',
                    '.ico$',
                    '.icns$',
                    '.webp$',
                    '.uproject$',
                    '-workspace$',
                },
                -- layout_strategy = 'vertical',
                -- layout_config = {
                    -- height = 0.0
                -- },
                results_title = false,
                prompt_prefix = '   ',
                selection_caret = '➤ ',
                mappings = {
                    i = {
                        ["<ESC>"] = actions.close
                    },
                },
            },
        }
    end,
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>ff', ":Telescope find_files<CR>" },
        { '<leader>fg', ":Telescope git_commits<CR>" },
        { '<leader>fh', ":Telescope help_tags<CR>" },
        { '<leader>fr', ":Telescope live_grep<CR>" },
        { '<leader>fm', ":Telescope marks<CR>" },
        { '<leader>fb', ":Telescope buffers<CR>" },
        { '<leader>fd', ":Telescope diagnostics<CR>" },
    },
}
