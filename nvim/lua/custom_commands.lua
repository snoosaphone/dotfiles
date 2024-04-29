vim.api.nvim_create_user_command('FindAndReplace', function(opts)
    vim.api.nvim_command(string.format('cdo s/%s/%s', opts.fargs[1], opts.fargs[2]))
    vim.api.nvim_command('cfdo update')
end, { nargs = '*' })

vim.api.nvim_set_keymap(
    'n',
    '<leader>ir',
    ':FindAndReplace ',
    { noremap = true }
)
