# FaultyBranches Dotfiles

Yet another repository of dotfiles, this time for the FaultyBranches way of setting up a non-machine specific user's software.

Included are configs for:
- neovim
- tmux
- wezterm
- zsh

While the setup is opinionated its goal is to provide desired behaviour rather than limiting to specific 

## Applications
### Neovim

Console/terminal based text editor with hefty extensibility, speed and flexibility.

The configs are an attempt at including some IDE functionalities
- Auto-complete via nvim-cmp
- LSP setup via lspconfig and mason
- Debugging via DAP and plugins
- Code snippets via luasnips and a base
- Git integration via gitsigns
- Syntax highlighting and symbol parsing via treesitter
- Quality of life options
    - Language aware shortcuts for (un)commenting lines or blocks
    - Zettlekasten style note plugin for taking/searching/linking notes
    - Markdown preview that opens a live updating html view of an edited markdown file
    - Telescope fuzzy search for files and file contents

### Tmux

_The_ terminal multiplexer for windowing and pane setups for long running shell sessions.

Simple configuration setup for a few shortcuts, adding the tpm plugin manager, and adding a couple plugins for colorscheme, system clipboard interactions
and a few "sensible" settings.

The main changes to shortcuts involve:
- Moving to Ctrl-Space for the prefix leader instead of the default Ctrl-b
- Using `\` and `-` for splitting the window vertically and horizontally, respectively, and unbinding the defaults
- Adding a config reload shortcut of `<prefix> r`
- Moving to vim-like movement between panes and windows
- Removing auto-renaming of windows based on content

### Wezterm

Cross-platform terminal emulator built from the ground up with speed, good font rendering, true color and a host of nice optional functions.

Simple setup with automatic config reloading, a colorscheme, font and a couple other bits.

### Zsh

NOTE: Auto-installs oh-my-zsh directly from the github repository when a user opens Zsh for the first time

Sets up the oh-my-zsh framework with:
    - Colorscheme
    - Autosuggestions and virtual text
    - Prompt theme
    - Python virtualenv auto-loader
    - .env auto-loader
    - AWS helper
    - Git helper and prompt updater

The config adds the following settings outside of oh-my-zsh:
    - PATH environment variable additions for:
        - Go binaries
        - Rust binaries
        - User $HOME based `.local/bin`
        - NVM (Nodejs) binaries
    - Keychain initialization for caching SSH keys
    - Adding a timing function for checking ZSH load timing
    - NVM (Nodejs) environment variable setup and completion loading
    - Local specific configuration file loading, with three initial configs:
        - `.zsh_aliases`: Aliases for local specific commands
        - `.zsh_exports`: Exported variables for a specific system
        - `.zsh_local`: Local ZSH settings for a specific system such as any environment specific bash required to set up a system's shell or direct ZSH settings
