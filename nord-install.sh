#! /bin/bash
#
# Installs the Nord theme by Arctic Ice Studio for various programs

function check_dependancies() {
  echo -e "\e[1mChecking dependancies\e[0m"
  
  # dconf is a low-level configuration manager for Gnome desktop
  if ! command -v dconf &>/dev/null; then
    echo -e "\e[1mdconf not found in PATH, installing...\e[0m"
    sudo apt install dconf-cli --yes --quiet
  fi

  # uuidgen is a universal unique identifier generator (UUID), it is shipped w/ 
  # the util-linux package
  if ! command -v uuidgen &>/dev/null; then
    echo -e "\e[1muuidgen not found in PATH, installing...\e[0m"
    sudo apt install util-linux --yes --quiet
  fi

  if ! command -v git &>/dev/null; then
    echo -e "\e[1mgit not found in PATH, installing...\e[0m"
    sudo apt install git --yes --quiet
  fi

  echo -e "\e[1mAll dependancies installed\e[0m"

  return 0
}

function install_gnome_terminal() {
  echo -e "\e[1mCloning repository from Github\e[0m"
  git clone --quiet https://github.com/arcticicestudio/nord-gnome-terminal.git 

  echo -e "\e[1mRunning shell script\e[0m"
  # use a subshell, otherwise the exit(3) call inside the script will kill the 
  # process   
  ( source nord-gnome-terminal/src/nord.sh ) 

  rm -rf "nord-gnome-terminal"

  echo -e "\e[1mNord Gnome Terminal Theme installed\e[0m"

  return 0
}

function install_dir_colors() {
  git clone --quiet git@github.com:arcticicestudio/nord-dircolors.git

  cp "nord-dircolors/src/dir_colors" "$HOME/.dir_colors"

  rm -rf "nord-dircolors"

  echo -e "\e[1mNord dir_colors Theme installed\e[0m"

  return 0
}

check_dependancies
install_gnome_terminal
install_dir_colors
exit 0
