#!/bin/sh
cd $HOME

#You first must install ZSH
sudo apt-get install -y zsh

#Install git
sudo apt-get install -y git-core

#Then get the oh-my-zsh 
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#The .zshrc is configured to use a plugin for the syntax highlighting
mkdir ~/.oh-my-zsh/custom/plugins
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#Clone this repo
cd $HOME

if [ ! -d ./ubuntu_settings/ ]; then
    git clone https://kperusko@bitbucket.org/kperusko/ubuntu_settings/
fi

#Run the script link_files.zsh to create symbolic links from this repo
sh ubuntu_settings/link_zsh_files.sh
