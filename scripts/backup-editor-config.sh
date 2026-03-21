#!/usr/bin/env zsh
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
CURSOR_USER="$HOME/Library/Application Support/Cursor/User"
CODE_USER="$HOME/Library/Application Support/Code/User"

# Destinations — pick ONE layout and stick to it
DEST_VSCODE="$DOTFILES/home/.vscode"
DEST_CURSOR="$DOTFILES/cursor/User"

mkdir -p "$DEST_VSCODE" "$DEST_CURSOR"

# Cursor → dotfiles
[[ -f "$CURSOR_USER/settings.json" ]] && cp -a "$CURSOR_USER/settings.json" "$DEST_CURSOR/settings.json"
[[ -f "$CURSOR_USER/keybindings.json" ]] && cp -a "$CURSOR_USER/keybindings.json" "$DEST_CURSOR/keybindings.json"

# VS Code → dotfiles (optional)
[[ -f "$CODE_USER/settings.json" ]] && cp -a "$CODE_USER/settings.json" "$DEST_VSCODE/settings-vscode.json"
# or overwrite settings.json if that file is your single source of truth for VS Code
