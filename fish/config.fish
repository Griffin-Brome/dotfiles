# URL: github.com/Griffin-Brome/dotfiles
# Authors: Griffin Brome
# Description: My fish configuration

set -x DOTFILES "$HOME/.dotfiles"
set -x EDITOR "vim"
set -x VISUAL "vim"

alias vi="vim"

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


function config -d "Edit the fish config file with $EDITOR, then source it"
    $EDITOR "$DOTFILES/fish/config.fish"
    source "$DOTFILES/fish/config.fish"
end
