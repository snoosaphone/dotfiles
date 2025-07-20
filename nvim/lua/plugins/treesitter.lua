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
                'gdscript',
                'gitignore',
                'html',
                'java',
                'javascript',
                'json',
                'lua',
                'markdown',
                'markdown_inline',
                'python',
                'query',
                'rust',
                'sql',
                'tera',
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
    end,
}
