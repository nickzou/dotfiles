#!/usr/bin/env bash
# Idempotently install tpm and the tmux plugins declared in tmux.conf.
#
# One source of truth for all three machines:
#   - NixOS  : called from home.nix's installTmuxPlugins activation
#   - macOS  : run `./tmux/bootstrap.sh` after `stow tmux`
#   - Ubuntu : run `./tmux/bootstrap.sh` after `stow tmux`
#
# Plugins install into ~/.tmux/plugins (pinned via TMUX_PLUGIN_MANAGER_PATH in
# tmux.conf) so third-party code never lands inside the stow-managed repo.
# Installs run on a throwaway tmux socket, so an interactive session you have
# open right now is never touched or killed.
set -euo pipefail

PLUGIN_DIR="$HOME/.tmux/plugins"
TPM="$PLUGIN_DIR/tpm"
CONF="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"

command -v git  >/dev/null 2>&1 || { echo "bootstrap: git not found on PATH"  >&2; exit 1; }
command -v tmux >/dev/null 2>&1 || { echo "bootstrap: tmux not found on PATH" >&2; exit 1; }

mkdir -p "$PLUGIN_DIR"

if [ ! -f "$TPM/tpm" ]; then
  echo "bootstrap: installing tpm"
  rm -rf "$TPM"
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM"
fi

# Install/update every @plugin from tmux.conf on an isolated socket.
SOCK="tpm-bootstrap-$$"
tmux -L "$SOCK" new-session -d 2>/dev/null || true
tmux -L "$SOCK" source-file "$CONF" 2>/dev/null || true
tmux -L "$SOCK" run-shell "$TPM/bin/install_plugins" || true
tmux -L "$SOCK" kill-server 2>/dev/null || true

echo "bootstrap: tmux plugins ready in $PLUGIN_DIR"
