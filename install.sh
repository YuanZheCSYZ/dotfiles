#!/bin/bash

# Generate .vimrc
if [ -e ~/.vimrc ]; then
    echo "Backup existing vimrc to ~/vimrc_bk"
    mv ~/.vimrc ~/vimrc_bk
fi
ln -s vimrc ~/.vimrc

# Install Vundle
if [ ! -e ~/.vim/bundle ]; then
    mkdir -P ~/.vim/bundle
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


