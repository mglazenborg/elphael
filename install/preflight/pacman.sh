#!/bin/bash

# Install build tools
sudo pacman -S --needed --noconfirm base-devel jq

# Configure pacman
sudo cp $ELPHAEL_PATH/default/pacman/pacman.conf /etc/pacman.conf

# Refresh repos and upgrade all packages
sudo pacman -Syu --noconfirm
