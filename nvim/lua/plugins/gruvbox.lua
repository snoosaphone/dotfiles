return {
    -- 'ellisonleao/gruvbox.nvim',
    'sainnhe/gruvbox-material',
    config = function()
        -- require('gruvbox').setup({
            -- contrast = 'hard',
        -- })
        -- vim.cmd([[colorscheme gruvbox]])
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'hard'
        vim.cmd.colorscheme('gruvbox-material')
    end,
    lazy = false,
    priority = 1000,
}
