return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            'jay-babu/mason-nvim-dap.nvim'
        },
        {
            'nvim-neotest/nvim-nio',
        },
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
                    windows = {
                        indent = 1
                    },
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
        local mason_dap = require('mason-nvim-dap')
        local dap, dapui = require('dap'), require('dapui')

        mason_dap.setup({
            ensure_installed = {
                'codelldb',
                'debugpy',
            },
            automatic_installation = true,
            handlers = {
                function(config)
                    require('mason-nvim-dap').default_setup(config)
                end,
            }
        })

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- vim.fn.sign_define('DapBreakpoint', { text = 'ᛒ', texthl = '', lineh = '', numhl = '' })
        vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', lineh = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '🝌', texthl = '', lineh = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '▶️' })

        -- dap.adapters.gdb = {
            -- type = 'executable',
            -- command = 'gdb',
            -- args = { '-i', 'dap' },
        -- }

        dap.adapters.lldb = {
            command = 'lldb',
            type = 'executable',
        }

        dap.adapters.debugpy = {
            command = 'debugpy',
            type = 'executable',
        }

        dap.configurations = {
            rust = {
                {
                    type = 'lldb',
                    name = 'Debug',
                    request = 'launch',
                    program = function()
                        return vim.fn.getcwd() .. '/target/debug/faultybranches'
                    end,
                    stopAtBeginningOfMainSubprogram = true,
                },
            },
            python = {
                {
                    type = 'python',
                    name = 'Launch current file',
                    request = 'launch',
                    program = '${file}',
                    pythonPath = function ()
                        if vim.env.VIRTUAL_ENV then
                            return vim.env.VIRTUAL_ENV .. '/bin/python'
                        end

                        return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
                    end
                }
            }
        }

        require('dap.ext.vscode').load_launchjs('.launch.json', {})
    end,
    keys = {
        {
            '<leader>b',
            function() require('dap').toggle_breakpoint() end,
            desc = 'DAP: Toggle Breakpoint',
        },
        {
            '<leader>B',
            function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
            desc = 'DAP: Set conditional breakpoint',
        },
        {
            '<leader>dh',
            function() require('dap.ui.widgets').hover() end,
            mode = 'n', 'v',
            desc = 'DAP: Debug hover',
        },
        {
            '<F5>',
            function() require('dap').continue() end,
            desc = 'DAP: Continue',
        },
        {
            '<F6>',
            function() require('dap').run_to_cursor() end,
            desc = 'DAP: Run to cursor',
        },
        {
            '<F8>',
            function() require('dap').terminate() end,
            desc = 'DAP: Terminate debug session',
        },
        {
            '<F10>',
            function() require('dap').step_over() end,
            desc = 'DAP: Step Over',
        },
        {
            '<F11>',
            function() require('dap').step_into() end,
            desc = 'DAP: Step Into',
        },
        {
            '<F12>',
            function() require('dap').step_out() end,
            desc = 'DAP: Step Out',
        },
    },
}
