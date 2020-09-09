#  _________  _   _ ____   ____
# |__  / ___|| | | |  _ \ / ___|
#   / /\___ \| |_| | |_) | |
#  / /_ ___) |  _  |  _ <| |___
# /____|____/|_| |_|_| \_\\____|

# ~/.zshrc
# Author: Griffin Brome (https://github.com/Griffin-Brome)

# user defined aliases
alias ls='ls --color=auto'
alias la='ls -A'
alias vim='nvim'
# user defined functions

# remember previous commands
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


# load line completion 
autoload -Uz compinit 
compinit

# use emacs bindings in terminal
bindkey -e

# plugins
# I use zplug to manage these

source ~/.zplug/init.zsh


# colored man pages
zplug "ael-code/zsh-colored-man-pages"

# syntax highlighting
zplug 'zdharma/fast-syntax-highlighting'

# autosuggestions
zplug 'zsh-users/zsh-autosuggestions'

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
# Make terminal play nice with tmux
TERM="xterm-256color"

