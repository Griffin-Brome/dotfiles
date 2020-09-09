# URL: github.com/Griffin-Brome/dotfiles
# Authors: Griffin Brome
# Description: My fish configuration


alias vim="nvim"
alias reload="source $HOME/.config/fish/config.fish"
set -x DOTFILES "$HOME/.dotfiles"
function mcd -d "Create a directory and set CWD"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end


function config
    nvim "$DOTFILES/fish/config.fish"
    source "$DOTFILES/fish/config.fish"
end


# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
