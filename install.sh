cd $HOME
if [ ! -d ./dotfiles/ ]; then
    git clone https://kperusko@bitbucket.org/kperusko/dotfiles/
fi

sh dotfiles/zsh/install.sh
sh dotfiles/emacs/install.sh
sh dotfiles/nodejs/install.sh
