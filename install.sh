cd $HOME
if [ ! -d ./dotfiles/ ]; then
    git clone https://kperusko@gihub.com/kperusko/dotfiles/
    git submodule init
    git submodule update
fi    

sh dotfiles/zsh/install.sh
sh dotfiles/emacs/install.sh
sh dotfiles/nodejs/install.sh
