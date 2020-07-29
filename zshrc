# ~/.zshrc
# Author: Griffin Brome (https://github.com/Griffin-Brome)

# user defined aliases
alias vim='nvim'
alias ls='ls --color=auto'
alias la='ls -A'

# user defined functions


# remember previous commands
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# load xcape bindings in the case it wasn't at boot
source ~/bin/vim_capslock_remap.sh

# load line completion 
autoload -Uz compinit 
compinit


# use emacs bindings in terminal
bindkey -e

# plugins
# I use zplug to manage these

source ~/.zplug/init.zsh

# Spaceship prompt theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# colored man pages
zplug "ael-code/zsh-colored-man-pages"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

# Plugin configuration

SPACESHIP_VENV_SYMBOL=" "
