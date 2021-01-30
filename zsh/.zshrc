# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

#alias lless="/usr/share/vim/vimcurrent/macros/less.sh"
#alias ccat="pygmentize -g"
alias psg="ps aux | head -1 && ps aux | grep "
alias gdc="git diff --cached"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git gitfast dircycle history-substring-search zsh-syntax-highlighting)


# Detect the OS type and load additional plugins
#case "$OSTYPE" in
#darwin*) plugins+=(brew) ;; 
#linux*)
#    case `lsb_release -s -i` in
#    Fedora)
#        plugins+=(yum systemd)
#        ;;
#    Ubuntu)
#        plugins+=(systemd)
#        ;;
#    esac
#    ;;
#*) echo "unknown: $OSTYPE" ;;
#esac

#syntax highlighters for the zsh-syntax-highlighting plugin
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/local/heroku/bin:$HOME/.rbenv/bin:$PATH
#PATH="/usr/local/bin:$HOME/.composer/vendor/bin:$PATH"


# Add frequently used folder to the cdpath. This will enable to cd to ~/code from anywhere
# More paths can be added - example: cdpath=(/path/to/dir1 /path/dir2)
cdpath=($HOME/code/)

# Start evals
#eval "$(rbenv init -)"

# CUSTOM FUNCTIONS

# Alias for starting emacs.
# Opens emacsclient and starts an emacsserver if not already started
#function e(){
#	nohup emacsclient -a "" -c $1 -F "((fullscreen . maximized))" >/dev/null 2>&1 &
#}

# Echoes the argument in the red color
#function echo_red(){
#    REDTXT=$1
#    TXT=$2
#    RED='\033[0;31m'
#    NC='\033[0m' # No Color
#    echo -e "${RED}${REDTXT}${NC}${TXT}"
#}

# Prints the command in red color before running it
#function run_cmd(){
#    echo_red 'Executing command: '$1
#    eval $1
#}

# Shortcut for rebasing local branches
# IMPORTANT:
# * Deletes the local branch even if it was not fully merged to upstream!
# * Force pushes the branch
#function grbtb(){
#    run_cmd 'gb -D '$1 # delete the local branch so we can get the latest version i next step
#    run_cmd 'gco '$1 || false
#    run_cmd 'git rebase develop' || false
#    run_cmd 'ggpush -f' || false 
#    run_cmd 'gco develop' || false
#    run_cmd 'gm '$1 || false
#}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
