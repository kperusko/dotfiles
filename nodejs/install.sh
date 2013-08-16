#!/bin/bash
# Simple install.sh for configuring NodeJS on Ubuntu
# for headless setup.

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

if [ -f $HOME/.bashrc ];
then 
	$SHELL_PROFILE = $HOME/.bashrc
fi

if [ -f $HOME/.zshrc ];
then 
	$SHELL_PROFILE = $HOME/.zshrc
fi

cat >> SHELL_PROFILE <<EOF

# Activate node version manager
source $HOME/.nvm/nvm.sh
nvm use v0.10.12
EOF
