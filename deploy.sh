#Zsh
if [ ! -L $HOME/.zshrc ]
then
    ln -fs $PWD/zshrc $HOME/.zshrc
fi

# Neovim
mkdir -p $HOME/.config/nvim
if [ ! -L $HOME/.config/nvim/init.lua ]
then
    ln -fs $PWD/nvim/init.lua $HOME/.config/nvim/init.lua
fi

if [ ! -L $HOME/.config/nvim/lua ]
then
    ln -fs $PWD/nvim/lua $HOME/.config/nvim/lua
fi

# Tmux
if [ ! -L $HOME/.tmux.conf ]
then
    ln -fs $PWD/tmux.conf $HOME/.tmux.conf
fi

if [ ! -L $HOME/.wezterm.lua ]
then
    ln -fs $PWD/wezterm.lua $HOME/.wezterm.lua
fi
