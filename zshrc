# call `zprof` to profile all calls in the current shell
# zmodload zsh/zprof

# Install oh-my-zsh if it doesn't exist
if [ ! -d $HOME/.oh-my-zsh/ ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

### ZSH Configuration
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fb-custom"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder frequency 14

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

# Enable compinit advanced completion
autoload -Uz compinit
compinit

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

# NVM required config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
