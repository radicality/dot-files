#!/bin/bash

ln -shFv ~/dot-files/vim ~/.vim
ln -shFv ~/dot-files/vim/vimrc ~/.vimrc
ln -shFv ~/dot-files/zsh/ ~/.zsh
ln -shFv ~/dot-files/zsh/zshrc ~/.zshrc
ln -shFv ~/dot-files/ghci ~/.ghci
ln -shFv ~/dot-files/gitconfig ~/.gitconfig
ln -shFv ~/dot-files/xvimrc ~/.xvimrc
ln -shFv ~/dot-files/tarsnaprc ~/.tarsnaprc
ln -shFv ~/dot-files/tmux.conf ~/.tmux.conf
ln -shFv ~/dot-files/dircolors ~/.dircolors
ln -shFv ~/dot-files/config/nvim/ ~/.config/nvim

# Tmux plugin manager
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp extra/tomorrow-night-eighties.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes
