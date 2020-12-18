#! /bin/bash
#
# Installs the Nord theme by Arctic Ice Studio for gnome terminal 

function check_dependancies() {
  echo "Checking dependancies"
  
  # dconf is a low-level configuration manager for Gnome desktop
  if ! command -v dconf &>/dev/null; then
    echo "dconf not found in PATH, installing..."
    sudo apt install dconf-cli -y
  fi

  # uuidgen is a universal unique identifier generator (UUID), it is shipped w/ 
  # the util-linux package
  if ! command -v uuidgen &>/dev/null; then
    echo "uuidgen not found in PATH, installing..."
    sudo apt install util-linux -y
  fi

  if ! command -v git &>/dev/null; then
    echo "git not found in PATH, installing..."
    sudo apt install git -y
  fi

  echo "All dependancies installed"

  return 0
}

function install_gnome_terminal() {
  echo "Cloning repository from Github"
  git clone https://github.com/arcticicestudio/nord-gnome-terminal.git 

  echo "Running shell script"
  # use a subshell, otherwise the exit(3) call inside the script will kill the 
  # process   
  ( source nord-gnome-terminal/src/nord.sh ) 

  rm -rf "nord-gnome-terminal"

  echo "Nord Gnome Terminal Theme installed"

  return 0
}

function install_dir_colors() {
  git clone git@github.com:arcticicestudio/nord-dircolors.git

  cp "nord-dircolors/src/dir_colors" "$HOME/.dir_colors"

  rm -rf "nord-dircolors"

  echo "Nord dir_colors Theme installed"

  return 0
}

check_dependancies
install_gnome_terminal
install_dir_colors
exit 0
