vim.api.nvim_create_user_command('FindAndReplace', function(opts)
    -- Update each quickfix location using substitute, update the files to save changes, close the opened buffers and close the quickfix window
    -- TODO: Does not close the buffers opened through changes
    vim.api.nvim_command(string.format('cdo s/%s/%s/g', opts.fargs[1], opts.fargs[2]) .. '| update | cclose')
end, { nargs = '*' })

vim.api.nvim_set_keymap(
    'n',
    '<leader>ir',
    ':FindAndReplace ',
    { noremap = true }
)
