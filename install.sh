#! /bin/bash
#
# Provisions a new Ubuntu 20.04 LTS system for programming

echo -e "\e[1mUpdating system\e[0m"
sudo apt update -qq \
  && sudo apt upgrade -qq --yes \
  && sudo apt autoremove -qq --yes \

# Installs the given program, if it is not already installed on the system
# @param $1 = command name
# @param $2 = (optional) package name, if different from command name
function install() {
  if ! command -v $1 &>/dev/null; then
    if [ ! -z $2 ]; then # Check if the 2nd parameter has been specified
      package = $2
    else
      package = $1
    fi
    echo -e "\e[1mInstalling $1..\e[0m"
    sudo apt install $package --yes --quiet
  fi
}

install git
install tmux
install nvim neovim
install gnome-tweaks
install stow

# TODO find a better way to check this
if $SHELL != "$(which zsh)"; then
  echo -e "\e[1mChanging default shell to zsh\e[0m"
  chsh -s "$(which zsh)"
fi

echo -e "\e[1mCreating symbolic links for config files (dotfiles)..\e[0m"
stow nvim tmux git &>/dev/null

ln --symbolic "$HOME/.dotfiles/bin" "$HOME"

cat <<'EOF'

 ___           _        _ _       _   _             
|_ _|_ __  ___| |_ __ _| | | __ _| |_(_) ___  _ __  
 | || '_ \/ __| __/ _` | | |/ _` | __| |/ _ \| '_ \ 
 | || | | \__ \ || (_| | | | (_| | |_| | (_) | | | |
|___|_| |_|___/\__\__,_|_|_|\__,_|\__|_|\___/|_| |_|
                                                    
  ____                      _      _       
 / ___|___  _ __ ___  _ __ | | ___| |_ ___ 
| |   / _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \
| |__| (_) | | | | | | |_) | |  __/ ||  __/
 \____\___/|_| |_| |_| .__/|_|\___|\__\___|
                     |_|                   

EOF
exit 0
