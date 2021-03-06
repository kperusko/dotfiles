#!/bin/bash
# Simple install.sh for configuring NodeJS on Ubuntu
# for headless setup.

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core

cd $HOME
git clone https://github.com/creationix/nvm.git $HOME/.nvm

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.33
nvm use v0.10.33

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

