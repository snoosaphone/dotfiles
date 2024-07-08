# call `zprof` to profile all calls in the current shell
# zmodload zsh/zprof

# Install oh-my-zsh if it doesn't exist
if [ ! -d $HOME/.oh-my-zsh/ ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fb-custom"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder frequency 14

plugins=(
    copypath
    dotenv
    git
    history
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Paths to prepend to system path
path=($GOPATH/bin
      $HOME/.cargo/bin
      $HOME/virtual_machines
      $HOME/unreal_editor_5/Engine/Binaries/Linux
      $path)

if command -v keychain &> /dev/null
then
    eval $(keychain --eval --quiet --nogui --noask)
fi

setopt NO_clobber
setopt hist_ignore_all_dups
setopt hist_ignore_space

timezsh() {
    shell=$SHELL
    for i in $(seq 1 10)
    do
        ts=$(date +%s%N)
        $SHELL -i -c exit
        echo $((($(date +%s%N) - $ts)/1000000))ms
    done
}

if [ ! -f "$HOME/.zsh_aliases" ]
then
    touch $HOME/.zsh_aliases
fi

include_files=(
    "$HOME/.zsh_aliases"
)

for file in $include_files
do
    source $file
done
