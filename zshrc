# call `zprof` to profile all calls in the current shell
# zmodload zsh/zprof

# Install oh-my-zsh if it doesn't exist
if [ ! -d $HOME/.oh-my-zsh/ ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

### ZSH Configuration
## Path variables
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export MANPAGER="less -R --use-color -Dd+r -Du+b" # Colored MAN pages

ZSH_THEME="fb-custom"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# History
HISTCONTROL=ignoreboth

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder frequency 14

# Keybindings
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
# bindkey "^h" backward-word
# bindkey "^k" kill-line
# bindkey "^j" backward-word
# bindkey "^k" forward-word
# bindkey "^J" history-search-forward
# bindkey "^K" history-search-backward

### Plugins
# Install the zsh-autosuggestions plugin if it doesn't exist
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

plugins=(
    aws
    copypath
    dotenv
    fzf
    git
    history
    zsh-autosuggestions
    virtualenv
    virtualenvwrapper # Used for autoloading project .venvs
)

# Load Oh My ZSH
source $ZSH/oh-my-zsh.sh

# ZSH options
setopt NO_clobber # Do not clobber files by default
setopt hist_ignore_all_dups # Replace old history with the newest call to an identical call
setopt hist_ignore_space # Remove history lines that start with spaces
# setopt correctall # Correct commands

# Experimental
setopt append_history inc_append_history share_history
# setopt auto_menu menu_complete
# setopt autocd
setopt auto_param_slash
setopt no_case_glob no_case_match
# setopt globdots

# Enable compinit advanced completion
zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -U colors && colors

# Completion options
# Give descriptions of what the types of completions given
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# Give an actual output when there is no match
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

### User configuration
export EDITOR=nvim
export NVM_CONFIG_PREFIX=$HOME/.local/

# Paths to prepend to system path
path=(
    $GOPATH/bin
    $HOME/.cargo/bin
    $HOME/.local/bin
    $NVM_CONFIG_PREFIX/bin
    $path
)

# Autoload keychain for ssh-agent handling if it is installed
if command -v keychain &> /dev/null
then
    eval $(keychain --eval --quiet --nogui --noask)
fi

### Custom functions
# Timing function for checking zsh load speed
timezsh() {
    shell=$SHELL
    for i in $(seq 1 10)
    do
        ts=$(date +%s%N)
        $SHELL -i -c exit
        echo $((($(date +%s%N) - $ts)/1000000))ms
    done
}

# Aliases Universal
alias rm="rm -Iv" # Prompt for removal of more than three files or recursively to give some protection of mistakes
alias df="df -h" # Always use the human readable formatting
alias du="du -h -d 1" # Always use human readable format and only for the current dir by default
alias k="killall" # Quick killall
alias p="ps aux | grep $1" # Quick 
alias v="$EDITOR" # Just open the usual editor 

### Environment specific include files
include_files=(
    "$HOME/.zsh_aliases"
    "$HOME/.zsh_exports"
    "$HOME/.zsh_local"
)

for file in $include_files; do
    if [ ! -f $file ]
    then
        touch $file
    fi

    source $file
done

# Custom rsync move function that also removes empty directories that have their contents removed
# NOTE: This will delete *any* empty directories in the CWD
rmv() {
    rsync -avzhP --remove-source-files --ignore-existing "${@:1:$#-1}" "${@:$#}" && \
        find ./* -depth -type d -empty -exec rmdir "{}" \;
}

# NVM required config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
