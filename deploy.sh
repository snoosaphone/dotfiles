#!/usr/bin/env bash

# Deployment script for dotfiles
#
# WARNING: This script _will_ clobber existing files by force linking

# Relative path/name as keys, destination path as values
declare -A configs=(
    ["zshrc"]="$HOME/.zshrc"
    ["fb-custom.zsh-theme"]="$HOME/.oh-my-zsh/custom/themes"
    ["nvim/init.lua"]="$HOME/.config/nvim/init.lua"
    ["nvim/lua"]="$HOME/.config/nvim/lua"
    ["nvim/snippets"]="$HOME/.config/nvim/snippets"
    ["tmux.conf"]="$HOME/.tmux.conf"
    ["wezterm.lua"]="$HOME/.config/wezterm/wezterm.lua"
    # ["wezterm.local_linux.lua"]="$HOME/.config/wezterm/local.lua"
    ["npmrc"]="$HOME/.npmrc"
)

declare -a config_directories=(
    "$HOME/.config/nvim"
    "$HOME/.config/wezterm"
)

for dir in ${config_directories[@]}; do
    mkdir -p ${dir}
done

for dotfile in "${!configs[@]}"; do
    echo "Deploying $PWD/${dotfile} to ${configs[$dotfile]}"
    ln -fs "$PWD/${dotfile}" "${configs[$dotfile]}"
done
