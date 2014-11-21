# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles
cd $HOME
if [ ! -d ./dotfiles/ ]; then
    git clone https://kperusko@github.com/kperusko/dotfiles/
    git submodule init
    git submodule update
fi    

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d-old
fi

ln -sf dotfiles/emacs/.emacs.d .
