return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            config = function()
                require('dapui').setup({
                    mappings = {
                        open = 'o',
                        remove = 'd',
                        edit = 'e',
                        repl = 'r',
                        toggle = 't',
                    },
                    layouts = {
                        {
                            elements = {
                                'scopes',
                                'breakpoints',
                                'stacks',
                            },
                            size = 0.33,
                            position = 'right',
                        },
                        {
                            elements = {
                                'console',
                                'watches',
                            },
                            size = 0.2,
                            position = 'bottom',
                        },
                    },
                    floating = {
                        max_height = nil,
                        max_width = nil,
                        border = 'single',
                        mappings = {
                            close = { 'q', '<Esc>' },
                        },
                    },
                    windows = { indent = 1 },
                    render = {
                        max_type_length = nil,
                    },
                })
            end,
        },
        {
            'theHamsta/nvim-dap-virtual-text',
            config = function()
                require('nvim-dap-virtual-text').setup()
            end,
        },
    },
    config = function()
        local dap, dapui = require('dap'), require('dapui')

        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.after.event_terminated['dapui_config'] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end

        vim.fn.sign_define('DapBreakpoint', { text = 'ᛒ', texthl = '', lineh = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '🝌', texthl = '', lineh = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '⮞' })
    end,
    keys = {
        {
            '<leader>b', function() require('dap').toggle_breakpoint() end
        },
        {
            '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end
        },
        {
            '<leader>dh',
            function() require('dap.ui.widgets').hover() end,
            mode = 'n', 'v'
        },
        {
            '<F5>', function() require('dap').continue() end
        },
        {
            '<F8>', function() require('dap').terminate() end
        },
        {
            '<F10>', function() require('dap').step_over() end
        },
        {
            '<F11>', function() require('dap').step_into() end
        },
        {
            '<F12>', function() require('dap').step_out() end
        },
    },
}
