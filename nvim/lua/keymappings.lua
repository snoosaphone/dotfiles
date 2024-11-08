local cf = require('custom_functions')
vim.g.mapleader = ','

-- Standard keybinding options
local options = { noremap = true }

-- Block tab/untab without leaving visual mode
vim.keymap.set('v', '<', '<gv', options)
vim.keymap.set('v', '>', '>gv', options)

-- Visual selection can be moved up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Sort selected lines alphabetically, descending
vim.keymap.set('v', '<leader>s', ':sort<CR>', options)

-- Move between panes in Neovim
vim.keymap.set('n', '<C-j>', '<C-w>j', options)
vim.keymap.set('n', '<C-k>', '<C-w>k', options)
vim.keymap.set('n', '<C-h>', '<C-w>h', options)
vim.keymap.set('n', '<C-l>', '<C-w>l', options)

-- Increment and decrement under the cursor
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('v', '+', '<C-a>')

vim.keymap.set('n', '-', '<C-x>')
vim.keymap.set('v', '-', '<C-x>')

-- Don't move the cursor when appending the following line to the current
vim.keymap.set('n', 'J', 'mzJ`z')

-- Switch or close buffers in the window
vim.keymap.set('n', '<leader>n', ':bn<CR>', options)
vim.keymap.set('n', '<leader>p', ':bp<CR>', options)
vim.keymap.set('n', '<leader>x', ':bp<bar>vs<bar>bn<bar>bd<CR>', options) -- Previous buffer, split, next buffer, delete buffer

-- Toggle spellcheck
vim.keymap.set('n', '<leader>s', ':set spell!<CR>', options)

-- Quick exit from Insert mode
vim.keymap.set('i', 'jk', '<ESC>', options)

-- Toggle display of whitespace chars
vim.keymap.set('n', '<leader>w', ':set list!<CR>', options)

-- Folding the section under the cursor
vim.keymap.set('n', '<space>', 'za')

-- Keymaps for custom functions
vim.keymap.set('n', '<leader>et', function() cf.execute('test') end)
vim.keymap.set('n', '<leader>er', function() cf.execute('run') end)
vim.keymap.set('n', '<leader>eb', function() cf.execute('build') end)
vim.keymap.set('n', '<leader>em', function() cf.execute('benchmark') end)

vim.keymap.set('n', '<leader>eo', ':Lexplore<CR>', options)

vim.keymap.set('n', '<leader>l', ':Lazy<CR>', options)
