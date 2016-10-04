#!/bin/bash
REPO_DIR=`pwd`

# Generate dot files
for conf in vimrc tmux.conf zshrc; do
    if [ -e ~/.${conf} ]; then
        echo "Backup existing  to ~/${conf}_bk"
        mv ~/.${conf} ~/${conf}_bk
    fi
    rm -f ~/.${conf}
    pushd ~
    ln -s ${REPO_DIR}/${conf} ~/.${conf}
    popd
done

# Install Vundle
if [ ! -e ~/.vim/bundle ]; then
    mkdir -P ~/.vim/bundle
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


