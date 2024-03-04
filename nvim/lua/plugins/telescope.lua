return {
    'nvim-telescope/telescope.nvim',
    config = function(_, opts)
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local fb_actions = telescope.extensions.file_browser.actions

        opts.defaults = {
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
            layout_config = { prompt_position = 'top' },
            layout_strategy = 'horizontal',
            mappings = {
                i = {
                    ['<ESC>'] = actions.close
                },
            },
            prompt_prefix = '   ',
            results_title = false,
            selection_caret = '➤ ',
            sorting_strategy = 'ascending',
            winblend = 0,
        }

        opts.pickers = {
            diagnostics = {
                theme = 'ivy',
                initial_mode = 'normal',
                layout_config = {
                    preview_cutoff = 9999,
                },
            },
        }

        opts.extensions = {
            file_browser = {
                theme = 'dropdown',
                hijack_netrw = true,
                mappings = {
                    ['n'] = {
                        ['N'] = fb_actions.create,
                        ['h'] = fb_actions.goto_parent_dir,
                    },
                },
            },
        }

        telescope.setup(opts)
        telescope.load_extension('file_browser')
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
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
        {
            'sf',
            function()
                local telescope = require('telescope')

                local function telescope_buffer_dir()
                    return vim.fn.expand('%:p:h')
                end

                telescope.extensions.file_browser.file_browser({
                    path = '%:p:h',
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = 'normal',
                    layout_config = {height = 40},
                })
            end,
        },
    },
}
