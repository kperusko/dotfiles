
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kperusko"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias node="env NODE_NO_READLINE=1 rlwrap node"
alias node_repl="node -e \"require('repl').start({ignoreUndefined: true})\""
alias lless="/usr/share/vim/vimcurrent/macros/less.sh"
alias ccat="pygmentize -g"
alias psg="ps aux | grep "

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast git-extras command-not-found gnu-utils history-substring-search zsh-syntax-highlighting) 

#syntax highlighters for the zsh-syntax-highlighting plugin
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/local/heroku/bin:$PATH

# Add Zend workspace to the cdpath. This will enable to cd Bookingsystem from anywhere.
# More paths can be added - example: cdpath=(/path/to/dir1 /path/dir2)
cdpath=($HOME/Zend/workspaces/DefaultWorkspace/)


# CUSTOM FUNCTIONS

# Load nodeJS on demand
function node_init(){
	if [ -f  $HOME/.nvm/nvm.sh ]; then
		source $HOME/.nvm/nvm.sh
		nvm use v0.10.12 > /dev/null
	else
		echo "nvm is not installed"
	fi
}

# Alias for starting emacs.
# Opens emacsclient and starts an emacsserver if not already started
function e(){
	nohup emacsclient -a "" -c $1 -F "((fullscreen . maximized))" >/dev/null 2>&1 &
}
