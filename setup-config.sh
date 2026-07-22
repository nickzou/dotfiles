#!/bin/bash

HOSTNAME=$(hostname -s)

# Packages shared across all machines
COMMON="bash zsh nvim tmux starship lsd lazygit yazi fastfetch ghostty"

# macOS-only shared packages
MACOS="aerospace"

# Linux-only packages
LINUX="gtk-3.0 hypr waybar wofi"

# Machine-specific packages (add as needed)
# WORK_ONLY="some-work-package"
# PERSONAL_ONLY="some-personal-package"

stow_packages() {
  for pkg in $@; do
    if [ -d "$pkg" ]; then
      echo "Stowing $pkg..."
      stow "$pkg"
    else
      echo "Skipping $pkg (not found)"
    fi
  done
}

cd "$(dirname "$0")"

stow_packages $COMMON

case "$(uname)" in
  Darwin) stow_packages $MACOS ;;
  Linux)  stow_packages $LINUX ;;
esac

case "$HOSTNAME" in
  Nicks-MacBook-Pro-2)
    echo "Setting up personal machine..."
    # stow_packages $PERSONAL_ONLY
    ;;
  work-hostname-here)
    echo "Setting up work machine..."
    # stow_packages $WORK_ONLY
    ;;
esac

echo "Done!"
