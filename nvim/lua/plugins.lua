local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require('plugins.mason'), -- LSP and DAP manager
    require('plugins.gruvbox'), -- Colorscheme
    require('plugins.comment'), -- Simple language specific commenting shortcuts
    require('plugins.dap'), -- DAP debugging plugin
    require('plugins.dap-python'), -- Debug plugin settings specifically for python
    require('plugins.treesitter'), -- Treesitter syntax highlighting and tree support
    require('plugins.gitsigns'), -- Gutter symbols for Git status and quick actions for Git operations
    require('plugins.luasnip'), -- Snippet enging
    require('plugins.nvim-cmp'), -- Autocompletion engine
    require('plugins.lualine'), -- Status line
    require('plugins.telekasten'), -- Note taking setup
    require('plugins.telescope'), -- Floating windows for searching and other operations
    'tpope/vim-surround', -- Change surrounding symbols
    require('plugins.floaterm'), -- Floating terminal
    require('plugins.vim-godot'), -- Godot specific bindings and debug
    require('plugins.markdown-preview'), -- Open a preview of markdown rendered in a browser
    require('plugins.render-markdown'), -- Render markdown directly in nvim (experimental, may take over for markdown-preview)
    require('plugins.autopairs'), -- Autocomplete symbol pairs when typing (experimental)
    require('plugins.nvim-biscuits'), -- Virtual text on closing tags for what the start of the block is (experimental)
    require('plugins.twilight') -- Focus mode, dim lines around the current segment of code
})
