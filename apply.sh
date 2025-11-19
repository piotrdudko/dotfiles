#!/bin/bash

# Nix

rm ~/.config/nix-darwin/flake.nix

mkdir -p ~/.config/nix-darwin

ln -s $PWD/config/nix-darwin/flake.nix ~/.config/nix-darwin/flake.nix

# To update packages installed via Nix in ~/.config/nix-darwin
# nix flake update --impure nixpkgs

darwin-rebuild switch --impure --flake ~/.config/nix-darwin#pdudko

# Helix
# rm ~/.config/helix/runtime
rm ~/.config/helix/languages.toml
rm ~/.config/helix/config.toml
rm ~/.config/helix/yazi-picker.sh

mkdir -p ~/.config/helix

# ln -s ~/helix/runtime ~/.config/helix/runtime
ln -s $PWD/config/helix/languages.toml ~/.config/helix/languages.toml
ln -s $PWD/config/helix/config.toml ~/.config/helix/config.toml
ln -s $PWD/config/helix/yazi-picker.sh ~/.config/helix/yazi-picker.sh

# Alacritty
rm ~/.config/alacritty

ln -s $PWD/config/alacritty ~/.config/alacritty

# Ghostty
mkdir -p ~/.config/ghostty
rm ~/.config/ghostty/config

ln -s $PWD/config/ghostty/config ~/.config/ghostty/config

# Zellij
mkdir -p ~/.config/zellij
rm ~/.config/zellij/config.kdl

cp $PWD/config/zellij/config.kdl ~/.config/zellij/config.kdl

# Yazi
mkdir -p ~/.config/yazi
rm ~/.config/yazi/yazi.toml

ln -s $PWD/config/yazi/yazi.toml ~/.config/yazi/yazi.toml

# # TMUX
# rm ~/.tmux.conf

# ln -s $PWD/tmux.conf ~/.tmux.conf
# tmux source-file ~/.tmux.conf

# ZSH
rm ~/.zshrc

cp $PWD/zshrc ~/.zshrc

# ZED
mkdir -p ~/.config/zed

ln -s $PWD/config/zed/* ~/.config/zed

# ------------ MacOS -----------
# skhd
mkdir -p ~/.config/skhd
rm ~/.config/skhd/skhdrc
ln -s $PWD/config/skhd/skhdrc ~/.config/skhd/skhdrc
skhd --restart-service

# yabai
mkdir -p ~/.config/yabai
rm ~/.config/yabai/yabairc
ln -s $PWD/config/yabai/yabairc ~/.config/yabai/yabairc
yabai --restart-service
