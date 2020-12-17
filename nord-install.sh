#! /bin/bash

# Author: Griffin Brome
# Description: Installs the Nord theme by Arctic Ice Studio for gnome terminal

# Check if dconf and uuigen are installed first, these are needed for the installer script
echo "Checking dependancies"

# dconf is a low-level configuration manager for Gnome desktop
if ! command -v dconf &>/dev/null; then
    echo "dconf not found in PATH, installing..."
    sudo apt install dconf-cli -y
fi

# uuidgen is a universal unique identifier generator (UUID), it is shipped w/ the util-linux package
if ! command -v uuidgen &>/dev/null; then
    echo "uuidgen not found in PATH, installing..."
    sudo apt install util-linux -y
fi

if ! command -v git &>/dev/null; then
    echo "git not found in PATH, installing..."
    sudo apt install git -y
fi

echo "All dependancies installed"

# Clone the repository from Github
echo "Cloning repository from Github"
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git &>/dev/null

# Install Terminal Theme
echo "Running shell script"

( source nord-gnome-terminal/src/nord.sh ) # use a subshell, otherwise the exit(3) call inside the script will kill the process   

# installation complete, directory no longer needed
rm -rf "nord-gnome-terminal"
