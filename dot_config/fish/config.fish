fish_add_path "$HOME/.local/bin"

if status is-interactive
    # Commands to run in interactive sessions can go here
    type -q brew && brew shellenv | source
    type -q mise && mise activate fish | source
    type -q fzf && fzf --fish | source
    type -q atuin && atuin init fish --disable-up-arrow | source
    type -q starship && starship init fish | source

    alias k=kubectl

    if type -q nvim
        alias vi=nvim
    end
end
