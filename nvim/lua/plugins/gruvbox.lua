return {
    'sainnhe/gruvbox-material',
    config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'hard'
        vim.cmd.colorscheme('gruvbox-material')
    end,
    lazy = false,
    priority = 1000,
}
