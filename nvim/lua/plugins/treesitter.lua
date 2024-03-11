return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
        require('nvim-treesitter.configs').setup {
            auto_install = true,
            ensure_installed = {
                'c',
                'c_sharp',
                'comment',
                'css',
                'gitignore',
                'html',
                'java',
                'javascript',
                'json',
                'lua',
                'python',
                'query',
                'rust',
                'sql',
                'toml',
                'tsx',
                'typescript',
                'yaml',
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            rainbow = {
                enable = true,
            }
        }
        -- require('nvim-treesitter.install').prefer_git = true
        -- TSUpdate
    end,
    lazy = false,
}
