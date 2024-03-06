--     use 'tpope/vim-fugitive'     -- Git integration
-- 
--     -- Experimental
--     use 'mfussenegger/nvim-dap'
--     use 'rcarriga/nvim-dap-ui'

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
    require('plugins/lspconfig'),
    require('plugins/mason'),
    require('plugins/gruvbox'),
    require('plugins/comment'),
    require('plugins/dap'),
    require('plugins/dap-python'),
    -- require('plugins/inc-rename'),
    require('plugins/treesitter'),
    require('plugins/vim-gitgutter'),
    require('plugins/luasnip'),
    require('plugins/nvim-cmp'),
    require('plugins/lualine'),
    require('plugins/telekasten'),
    require('plugins/telescope'),
    'tpope/vim-surround',
    require('plugins/floaterm'),
    require('plugins/vim-godot'),
})
