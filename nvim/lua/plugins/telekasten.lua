function string.insert(str1, str2, pos)
    return str1:sub(1, pos)..str2..str1:sub(pos+1)
end

function toggleTODO(current_line)
    local todo_str = '%- %[ %] '
    local todo_checked_str = '%- %[x%] '

    if current_line:find(todo_str, 1) then
        return string.gsub(current_line, todo_str, '', 1)
    elseif current_line:find(todo_checked_str, 1) then
        return string.gsub(current_line, todo_checked_str, '', 1)
    else
        local first_idx = current_line:find('[%-%w]', 1) - 1
        return string.insert(current_line, '- [ ] ', first_idx)
    end
end

vim.api.nvim_create_user_command('ToggleTODO', function()
    local current_line = vim.api.nvim_get_current_line()
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))

    local new_line = toggleTODO(current_line)

    vim.api.nvim_buf_set_lines(0, row-1, row, true, {new_line})
end, {})

return {
    'renerocksai/telekasten.nvim',
    config = function()
        local home = vim.fn.expand('~/.zettelkasten')
        require('telekasten').setup({
            home                  = home,
            dailies               = home .. '/' .. 'daily',
            weeklies              = home .. '/' .. 'weeklies',
            templates             = home .. '/' .. 'templates',
            template_new_note     = home .. '/' .. 'templates/new_note.md',
            template_new_daily    = home .. '/' .. 'templates/daily.md',
            template_new_weekly   = home .. '/' .. 'templates/weekly.md',
            command_palette_theme = 'ivy',
            show_tags_theme       = 'get_cursor',
            plug_into_calendar    = false,

        })

        -- Color for telekasten syntax
        vim.api.nvim_set_hl(0, 'tkLink', { ctermfg = 72, cterm = { bold = true, underdouble = true }, fg = '#689d6a', bold = true, underdouble = true })
        vim.api.nvim_set_hl(0, 'tkBrackets', { ctermfg = 'gray', fg = 'gray' })
        vim.api.nvim_set_hl(0, 'tkTag', { ctermfg = 'gray', fg = 'gray' })
    end,
    keys = {
        { '<leader>zp', ':Telekasten panel<CR>' },
        { '<leader>zn', ':Telekasten find_notes<CR>' },
        { '<leader>zt', ':Telekasten show_tags<CR>' },
        { '<leader>tt', ':ToggleTODO<CR>' },
    },
    -- lazy = false
}
