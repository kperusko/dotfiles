# !/bin/sh
cd $HOME

# You first must install ZSH
#sudo apt-get install -y zsh

# Install git
#sudo apt-get install -y git-core

# Then get the oh-my-zsh 
#git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# The .zshrc is configured to use a plugin for the syntax highlighting
mkdir $HOME/.oh-my-zsh/custom/plugins
cd $HOME/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#Clone dotfiles repo
cd $HOME
if [ ! -d ./dotfiles/ ]; then
    git clone https://kperusko@github.com/kperusko/dotfiles/
    git submodule init
    git submodule update
fi    

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Create symbolic links from this repo
cd $HOME/dotfiles/zsh
ln -sf $(pwd)/.zshrc $HOME/.zshrc
