return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            auto_install = true,
            ensure_installed = {
                'c',
                'c_sharp',
                'comment',
                'css',
                'html',
                'java',
                'javascript',
                'json',
                'lua',
                'python',
                'query',
                'rust',
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
