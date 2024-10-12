-- Fix for treesitter folds, as folds are not recalculated upon buffer changes (especially when pasting text)
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew', 'BufWinEnter' }, {
    -- pattern = '*',
    -- group = vim.api.nvim_create_augroup('telescope_fold_workaround', { clear = true }),
    -- command = 'set foldexpr=nvim_treesitter#foldexpr()',
-- })

-- Disables syntax, treesitter and folding on larger files
vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
    pattern = '*',
    group = vim.api.nvim_create_augroup('largefile', { clear = true }),
    callback = function(args)
        local max_filesize_MiB = 2

        local _, stats = pcall(function()
            return vim.loop.fs_stat(vim.api.nvim_buf_get_name(args.buf))
        end)

        local file_size = math.floor(0.5 + (stats.size / (1024 * 1024)))

        if file_size > max_filesize_MiB then
            -- print(string.format('Big file detected above %sMiB. Disabling syntax, treesitter, and folding.', max_filesize_MiB))
            vim.api.nvim_command('set foldmethod=manual')
        end
    end,
})
