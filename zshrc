# ~/.zshrc
# Author: Griffin Brome (https://github.com/Griffin-Brome)

# load in custom user themes
fpath=("$HOME/.zprompts" "$fpath[@]")


# Start tmux in every nonlogin shell
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# user defined aliases
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias v='vim'
alias vi='vim'
alias glog='git log --all --graph --decorate'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# user defined functions
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo "(`basename \"$VIRTUAL_ENV\"`)"
}

# allow for zsh to detect git metadata (for prompts)
source ~/bin/git-prompt.sh

# load line completion and prompts
autoload -Uz compinit promptinit
compinit
promptinit
prompt igloo

