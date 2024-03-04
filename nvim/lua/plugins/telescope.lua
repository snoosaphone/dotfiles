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
        {
            ';f',
            function()
                require('telescope.builtin').find_files({
                    no_ignore = false,
                    hidden = true,
                    file_ignore_patterns = {
                        '.git',
                        '.node_modules',
                    },
                })
            end,
        },
        {
            ';r',
            function()
                require('telescope.builtin').live_grep()
            end,
        },
        {
            '\\\\',
            function()
                require('telescope.builtin').buffers()
            end,
        },
        {
            ';h',
            function()
                require('telescope.builtin').help_tags()
            end,
        },
        {
            ';;',
            function()
                require('telescope.builtin').resume()
            end,
        },
        {
            ';d',
            function()
                require('telescope.builtin').diagnostics()
            end,
        },
        {
            ';t',
            function()
                require('telescope.builtin').treesitter()
            end,
        },
        {
            ';s',
            function()
                require('telescope.builtin').lsp_document_symbols()
            end
        },
        {
            ';w',
            function()
                require('telescope.builtin').lsp_dynamic_workspace_symbols()
            end
        },
    },
}
