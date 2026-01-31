#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Helix
mkdir -p ~/.config/helix
ln -sf "$DOTFILES/config/helix/languages.toml" ~/.config/helix/languages.toml
ln -sf "$DOTFILES/config/helix/config.toml" ~/.config/helix/config.toml
ln -sf "$DOTFILES/config/helix/yazi-picker.sh" ~/.config/helix/yazi-picker.sh

# Alacritty
rm -rf ~/.config/alacritty
ln -s "$DOTFILES/config/alacritty" ~/.config/alacritty

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES/config/ghostty/config" ~/.config/ghostty/config

# Zellij
mkdir -p ~/.config/zellij
cp "$DOTFILES/config/zellij/config.kdl" ~/.config/zellij/config.kdl

# Yazi
mkdir -p ~/.config/yazi
ln -sf "$DOTFILES/config/yazi/yazi.toml" ~/.config/yazi/yazi.toml

# ZSH
ln -sf "$DOTFILES/zshrc" ~/.zshrc

# Zed
mkdir -p ~/.config/zed
for file in "$DOTFILES/config/zed"/*; do
    ln -sf "$file" ~/.config/zed/
done

# ------------ Linux only -----------
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Niri
    mkdir -p ~/.config/niri
    ln -sf "$DOTFILES/config/niri/config.kdl" ~/.config/niri/config.kdl
    niri msg action reload-config 2>/dev/null || true

    # wpaperd (wallpaper daemon)
    mkdir -p ~/.config/wpaperd
    ln -sf "$DOTFILES/config/wpaperd/config.toml" ~/.config/wpaperd/config.toml

    # Waybar
    rm -rf ~/.config/waybar
    ln -s "$DOTFILES/config/waybar" ~/.config/waybar
    killall -SIGUSR2 waybar 2>/dev/null || true
fi

# ------------ macOS only -----------
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Nix
    mkdir -p ~/.config/nix-darwin
    ln -sf "$DOTFILES/config/nix-darwin/flake.nix" ~/.config/nix-darwin/flake.nix
    darwin-rebuild switch --impure --flake ~/.config/nix-darwin#pdudko

    # skhd
    mkdir -p ~/.config/skhd
    ln -sf "$DOTFILES/config/skhd/skhdrc" ~/.config/skhd/skhdrc
    skhd --restart-service

    # yabai
    mkdir -p ~/.config/yabai
    ln -sf "$DOTFILES/config/yabai/yabairc" ~/.config/yabai/yabairc
    yabai --restart-service
fi
