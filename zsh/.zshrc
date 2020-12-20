#         _
# _______| |__  _ __ ___
#|_  / __| '_ \| '__/ __|
# / /\__ | | | | | | (__
#/___|___|_| |_|_|  \___|

setopt histignorealldups sharehistory

# http://zsh.sourceforge.net/Guide/zshguide04.html
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# User configuration
export VISUAL="nvim"
export EDITOR="nvim"

function zshrc {
    $EDITOR "$HOME/.zshrc"
    source "$HOME/.zshrc"
}

alias vi="nvim"
alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -A"

# Personal environment variables
export DOTFILES="$HOME/.dotfiles" 
export UNI="$HOME/Documents/university"
export MANPAGER='nvim +Man' # Use neovim as pager for man pages
export MANWIDTH=999 # Allows for soft wrapping when using nvim as a man pager


# Load chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Add git metadata to prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT="%B%F{yellow} \$vcs_info_msg_0_%f%b"
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'
# Set up the prompt
export PROMPT="%B%F{green}%n%f%b@%M %F{green}%1~%f %# "

