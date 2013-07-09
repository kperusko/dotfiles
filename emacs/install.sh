# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install configs as well
cd $HOME
if [ ! -d ./ubuntu_settings/ ]; then
    git clone https://kperusko@bitbucket.org/kperusko/ubuntu_settings/
fi

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d-old
fi

ln -sf ubuntu_settings/emacs/.emacs.d .
