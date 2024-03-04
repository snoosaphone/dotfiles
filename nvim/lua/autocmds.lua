-- Fix for treesitter folds, as folds are not recalculated upon buffer changes (especially when pasting text)
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew', 'BufWinEnter' }, {
    pattern = '*',
    group = vim.api.nvim_create_augroup('telescope_fold_workaround', { clear = true }),
    command = 'set foldexpr=nvim_treesitter#foldexpr()',
})
