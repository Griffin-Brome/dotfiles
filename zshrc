# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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


# load line completion 
autoload -Uz compinit 
compinit


# use emacs bindings in terminal
bindkey -e

# plugins
# I use zplug to manage these

source ~/.zplug/init.zsh

# P10k prompt theme
zplug 'romkatv/powerlevel10k', as:theme, depth:1

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
