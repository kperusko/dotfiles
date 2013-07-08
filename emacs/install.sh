# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
if [ -d .emacs.d/ ]; then
mv .emacs.d .emacs.d-old
fi

ln -sf ubuntu_settings/emacs/.emacs.d .
