#!/bin/sh
cd $HOME

#You first must install ZSH
sudo apt-get install -y zsh

#Install git
sudo apt-get install -y git-core

#Then get the oh-my-zsh 
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#The .zshrc is configured to use a plugin for the syntax highlighting
mkdir $HOME/.oh-my-zsh/custom/plugins
cd $HOME/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#Clone this repo
cd $HOME

if [ ! -d ./dotfiles/ ]; then
    git clone https://kperusko@bitbucket.org/kperusko/dotfiles/
fi

#Create symbolic links from this repo
cd $HOME/dotfiles/zsh
ln -sf $(pwd)/.zshrc $HOME/.zshrc
ln -sf $(pwd)/.oh-my-zsh/themes/kperusko.zsh-theme $HOME/.oh-my-zsh/themes/kperusko.zsh-theme

#Copy terminal preferences for gnome terminal
#These are not dependent on zsh
cd $HOME
if [ ! -d "./.gconf/apps/gnome-terminal/" ]; then
	echo "Directory .gconf/apps/gnome-terminal/ doesn't exists. Gnome terminal preferences not installed!"
	exit 0;
fi

if [ -f "./.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml" ]; then
	mv "./.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml" "./.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml.bak"
fi

cd $HOME/dotfiles/zsh
ln -sf $(pwd)/"%gconf.xml" "$HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml"
