return {
    'code-biscuits/nvim-biscuits',
    config = function ()
        require('nvim-biscuits').setup({
            default_config = {
                max_length = 3,
                trim_by_words = true,
                min_distance = 5,
                prefix_string = " 📎 ",
            },
            -- on_events = { 'InsertLeave', 'CursorHoldI' },
            max_file_size = '250kb',
            -- show_on_start = true,
            cursor_line_only = true,
            language_config = {
                markdown = {
                    disabled = true
                }
            }
        })
    end
}
