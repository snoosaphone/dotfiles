return {
    'mason-org/mason.nvim',
    config = function()
        require('mason').setup()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        -- All functions and keymaps contained here are universal to LSPs
        local on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Keyboard Mappings
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', '<C-[>', vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set('n', '<C-]>', vim.diagnostic.goto_next, bufopts)
            -- vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
            vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader><leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
        end

        require('mason-lspconfig').setup {
            automatic_enable = true,
            automatic_installation = true,
            ensure_installed = {
                'ansiblels',
                'arduino_language_server',
                'bashls',
                'clangd', -- C/C++
                -- 'hadolint', -- Dockerfile linting
                'intelephense', -- PHP
                -- 'jdtls', -- java
                'lua_ls',
                'marksman', -- markdown
                'pylsp',
                'rust_analyzer',
                'ts_ls', -- Typscript
                'yamlls',
            }
        }

        vim.diagnostic.config ({
            virtual_text = {
                source = "always",
            },
            severity_sort = true,
            float = {
                source = "always"
            },
        })

        -- Kick the logging to debug level
        -- vim.lsp.set_log_level("debug")

        vim.lsp.config('gdscript', {
            flags = {
                debounce_text_changes = 100,
            }
        })

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            'vim'
                        }
                    }
                }
            }
        })

        vim.lsp.config('pylsp', {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = {
                                'E501' -- Ignore line length pep8 warnings
                            },
                            maxLineLength = 120,
                        }
                    }
                }
            }
        })

        vim.lsp.config("rust_analyzer", {
            settings = {
                ['rust_analyzer'] = {
                    check = {
                        command = 'clippy',
                        extraArgs = {
                            '--',
                            '-D clippy::all',
                            '-W clippy::pedantic',
                            '-W clippy::restriction'
                        },
                    },
                    diagnostics = {
                        enable = true,
                        experimental = {
                            enable = true,
                        }
                    }
                }
            }
        })

        vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
    lazy = false,
}
