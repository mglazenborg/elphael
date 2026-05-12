#!/bin/bash

ascii='
 /$$$$$$$$ /$$       /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$$ /$$
| $$_____/| $$      | $$__  $$| $$  | $$ /$$__  $$| $$_____/| $$
| $$      | $$      | $$  \ $$| $$  | $$| $$  \ $$| $$      | $$
| $$$$$   | $$      | $$$$$$$/| $$$$$$$$| $$$$$$$$| $$$$$   | $$
| $$__/   | $$      | $$____/ | $$__  $$| $$__  $$| $$__/   | $$
| $$      | $$      | $$      | $$  | $$| $$  | $$| $$      | $$
| $$$$$$$$| $$$$$$$$| $$      | $$  | $$| $$  | $$| $$$$$$$$| $$$$$$$$
|________/|________/|__/      |__/  |__/|__/  |__/|________/|________/'

clear
echo -e "\n$ascii\n"

sudo pacman -Syu --noconfirm --needed git

echo -e "\nCloning repo from: https://github.com/mglazenborg/elphael.git"
rm -rf ~/.local/share/elphael
git clone "https://github.com/mglazenborg/elphael.git" ~/.local/share/elphael >/dev/null

echo -e "\nStarting installation..."
source ~/.local/share/elphael/install.sh
