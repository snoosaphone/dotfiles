return {
    'nvim-telescope/telescope.nvim',
    config = function(_, opts)
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')
        local fb_actions = telescope.extensions.file_browser.actions

        local custom_actions = {}

        function custom_actions.grep_multi_select(prompt_bufnr)
            local function get_table_size(t)
                local count = 0
                for _ in pairs(t) do
                    count = count + 1
                end
                return count
            end

            local picker = action_state.get_current_picker(prompt_bufnr)
            local num_selections = get_table_size(picker:get_multi_selection())

            if num_selections > 1 then
                actions.send_selected_to_qflist(prompt_bufnr)
                actions.open_qflist()
            else
                actions.file_edit(prompt_bufnr)
            end
        end

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
                    ['<ESC>'] = actions.close,
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
            grep_string = {
                initial_mode = 'normal',
                mappings = {
                    ['n'] = {
                        ['<cr>'] = custom_actions.grep_multi_select,
                    },
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
        'kevinhwang91/nvim-bqf',
    },
    keys = {
        {
            ';f',
            function()
                require('telescope.builtin').find_files({
                    no_ignore = false,
                    hidden = true,
                    file_ignore_patterns = {
                        '.git/',
                        '.node_modules/',
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
            ';b',
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
            ';g',
            function()
                require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})
            end
        },
        {
            '<leader>rn',
            function()
                require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })
            end
        },
        {
            ';e',
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
