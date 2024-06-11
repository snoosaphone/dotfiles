vim.opt.background = 'dark'                                         -- Force a dark background for the colorscheme
vim.opt.clipboard = 'unnamed,unnamedplus'                           -- Use both the "*" and "+" registers for yanks and deletes (puts things in the system clipboard)
vim.opt.colorcolumn = '121'                                         -- Highlight column to show
vim.opt.completeopt = 'menu,menuone,noinsert'                       -- Change how the completion menu is interacted with
vim.opt.cursorcolumn = true                                         -- Highlight the column the cursor is on
vim.opt.cursorline = true                                           -- Highlight the line the cursor is on.
vim.opt.expandtab = true                                            -- Expand tabs into spaces
vim.opt.fileformat = 'unix'                                         -- Explicitly state that files should use the unix style EOL characters.
vim.opt.fillchars = 'fold: '                                        -- Sets the character that fills in a fold line
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'                     -- Uses Treesitter to determine where code folding should occur
vim.opt.foldlevel = 10                                              -- Sets the initial level at which folds will be closed
vim.opt.foldmethod = 'expr'                                         -- Attempt to use the syntax of a file to set folds.
vim.opt.formatoptions = 'cqrto'                                     -- Allow auto insertion of comment lines when using o or O on a comment.
vim.opt.list = true                                                 -- Show the listchars
vim.opt.listchars = 'tab:|·,trail:¬,extends:>,precedes:<,nbsp:+'    -- Characters to display when showing whitespace
vim.opt.mouse = 'a'                                                 -- Enable mouse mode
vim.opt.number = true                                               -- Show the line number in the gutter.
vim.opt.relativenumber = true                                       -- Relative line number
vim.opt.shiftround = true                                           -- Round indentation to shiftwidth
vim.opt.shiftwidth = 4                                              -- Number of spaces a tab counts for when converting tabs to spaces
vim.opt.shortmess = 'at'                                            -- Abbreviations and truncation of cmd messages
vim.opt.showmatch = true                                            -- Show matching bracket
vim.opt.signcolumn = 'yes'                                          -- Always show the gutter
vim.opt.smartindent = true                                          -- Attempt to insert indentation to fit traditional languages.
vim.opt.softtabstop = 4                                             -- Number of spaces a tab counts for when converting tabs to spaces
vim.opt.splitbelow = true                                           -- Split windows below when horizontal splitting
vim.opt.splitright = true                                           -- Split windows right when vertical splitting
vim.opt.swapfile = false                                            -- Disable the creation of swap files for open files
vim.opt.tabstop = 4                                                 -- Setting the value of spaces per tab
vim.opt.termguicolors = true                                        -- Enable the truecolor GUI colors in a terminal
vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'      -- Set a specific undo file directory
vim.opt.undofile = true                                             -- Enable undo files
vim.opt.updatetime = 50                                             -- Update time in milliseconds
vim.opt.wrap = false                                                -- Do _not_ wrap lines
