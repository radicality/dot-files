#!/bin/bash

ln -sf ~/dot-files/vim ~/.vim
ln -sf ~/dot-files/vim/vimrc ~/.vimrc
ln -sf ~/dot-files/zsh/ ~/.zsh
ln -sf ~/dot-files/zsh/zshrc ~/.zshrc
ln -sf ~/dot-files/ghci ~/.ghci
ln -sf ~/dot-files/gitconfig ~/.gitconfig
ln -sf ~/dot-files/xvimrc ~/.xvimrc
ln -sf ~/dot-files/tarsnaprc ~/.tarsnaprc
ln -sf ~/dot-files/tmux.conf ~/.tmux.conf
ln -sf ~/dot-files/dircolors ~/.dircolors

ln -sf ~/dot-files/config/nvim/ ~/.config/nvim

# Tmux plugin manager
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp extra/tomorrow-night-eighties.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes
