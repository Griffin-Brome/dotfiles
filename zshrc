# ~/.zshrc
# Author: Griffin Brome (https://github.com/Griffin-Brome)

# load in custom user themes
fpath=("$HOME/.zprompts" "$fpath[@]")

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
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias glog='git log --all --graph --decorate'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias la='ls -A'

# user defined functions


# remember previous commands
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# load xcape bindings in the case it wasn't at boot
source ~/bin/vim_capslock_remap.sh
# allow for zsh to detect git metadata (for prompts)
source ~/bin/git-prompt.sh

# load line completion and prompts
autoload -Uz compinit 
compinit



# check if starship is installed 
if ! [ -e /usr/local/bin/starship ]; then
    curl -fsSL https://starship.rs/install.sh | bash # install latest starship version
fi
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship # move starship config file to $HOME

# use vim bindings in terminal
bindkey -v

# plugins
# I use zplug to manage these

source ~/.zplug/init.zsh

# syntax highlighting
zplug "zdharma/fast-syntax-highlighting", defer:2

# autosuggestions as you type
zplug "zsh-users/zsh-autosuggestions"

# ctrl-space accepts the current suggestion, I try to do this with all my programs
bindkey '^ ' autosuggest-accept

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
