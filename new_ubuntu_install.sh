#!/bin/bash

# update the repo and upgrade all existing packages
apt-get update -y
apt-get upgrade -y

# remove vim.tiny b/c who uses vim.tiny 
apt-get remove -y vim.tiny

# make sure basic stuff is installed is installed
apt-get install -y git wget curl net-tools

# install python stuff
apt-get install -y python3 python3-dev python3-pip python3-setuptools

# install zsh, set default shell, then get oh-my-zsh and download all dependencies and configs
apt-get install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
apt-get install -y fonts-powerline
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# cp configs to the correct place
cp ./.zshrc ../
cp ./.tmux.conf ../

# install thefuck
pip3 install thefuck

source ~/.zshrc
