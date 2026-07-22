#!/usr/bin/env bash
# Restart Waybar (bound to SUPER+SHIFT+B in hyprland config).
# Kills any running instances, waits for them to exit, then relaunches.
#
# NOTE: on NixOS the real process is named ".waybar-wrapped", so we must NOT
# use `pkill -x waybar` (exact match) — plain substring match is what works.

pkill waybar

# Wait until the processes are actually gone before relaunching.
while pgrep waybar >/dev/null; do sleep 0.1; done

waybar &
