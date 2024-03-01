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
                        ['<ESC>'] = actions.close
                    },
                },
            },
        }
    end,
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>' },
        { '<leader>fg', '<cmd>Telescope git_commits<CR>' },
        { '<leader>fh', '<cmd>Telescope help_tags<CR>' },
        { '<leader>fr', '<cmd>Telescope live_grep<CR>' },
        { '<leader>fm', '<cmd>Telescope marks<CR>' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>' },
        { '<leader>fd', '<cmd>Telescope diagnostics<CR>' },
        { '<leader>fs', '<cmd>Telescope lsp_document_symbols<CR>' },
        { '<leader>fw', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>' },
    },
}
