#!/bin/bash
# The script assume this repo was cloned into ~/.vim
git checkout $1

# Could be $(pwd)/vimrc but then still need to link .vim to pwd
# Think about a pretty solution
ln -s ~/.vim/vimrc ~/.vimrc

# Same here, could be $(pwd) instead of ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

apt-get install -y exuberant-ctags

vim +PluginInstall +qall
