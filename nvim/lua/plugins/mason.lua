return {
    'williamboman/mason.nvim',
    config = function()
        require('mason').setup()

        local mason_lspconfig = require('mason-lspconfig')

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
            -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader><leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

            -- DAP debug
            if dap then
                vim.keymap.set('n', '<F5>', function() dap.continue() end, bufopts)
                vim.keymap.set('n', '<F10>', function() dap.step_over() end, bufopts)
                vim.keymap.set('n', '<F11>', function() dap.step_into() end, bufopts)
                vim.keymap.set('n', '<F12>', function() dap.step_out() end, bufopts)
                vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, bufopts)
            end
        end

        mason_lspconfig.setup {
            automatic_installation = true,
            ensure_installed = {
                'ansiblels',
                'arduino_language_server',
                'bashls',
                'clangd',
                -- 'hadolint', -- Dockerfile linting
                'intelephense',
                -- 'jdtls', -- java
                'lua_ls',
                'marksman', -- markdown
                -- 'prettier',
                'pylsp',
                'rust_analyzer',
                -- 'snyk',
                'ts_ls', -- Typscript
                -- 'volar', -- Vue
                'yamlls',
            }
        }

        local lspconfig = require('lspconfig')

        mason_lspconfig.setup_handlers {
            function(server_name)
                lspconfig[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach
                }
            end,

            ['rust_analyzer'] = function()
                lspconfig.rust_analyzer.setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        ['rust-analyzer'] = {
                            checkOnSave = true,
                            -- check = {
                                -- command = 'clippy',
                                -- extraArgs = { '--', '-Dclippy::all', '-Wclippy::pedantic' },
                            -- },
                            diagnostics = {
                                enable = true,
                                experimental = {
                                    enable = true,
                                }
                            }
                        }
                    }
                }
            end,

            ['lua_ls'] = function()
                lspconfig.lua_ls.setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' }
                            }
                        }
                    }
                }
            end,

            ['pylsp'] = function()
                lspconfig.pylsp.setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = {
                                    ignore = {'E501'}
                                }
                            }
                        }
                    }
                }
            end,

            lspconfig.gdscript.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                flags = {
                    debounce_text_changes = 100,
                }
            }

            -- ['gdshader_lsp'] = function()
                -- lspconfig.gdshader_lsp.setup {
                    -- capabilities = capabilities,
                    -- on_attach = on_attach,
                -- }
            -- end,
        }
    end,
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
}
