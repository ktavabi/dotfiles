#!/usr/bin/env bash

set -e

<<<<<<< HEAD
SOURCE="$HOME/.config/agents/AGENTS.md"

link_agent_instructions() {
  target_dir="$1"
  target_name="${2:-${SOURCE##*/}}"
=======
DOTFILES=${DOTFILES:-"$HOME/.dotfiles"}
SOURCE="$DOTFILES/agents/AGENTS.md"

link_agent_instructions() {
  target_dir="$1"
>>>>>>> 8173c99 (feat: add installation and update scripts, link agent instructions, and refine aliases)

  if [ ! -d "$target_dir" ]; then
    return
  fi

<<<<<<< HEAD
  ln -sfn "$SOURCE" "$target_dir/$target_name"
=======
  ln -sfn "$SOURCE" "$target_dir/AGENTS.md"
>>>>>>> 8173c99 (feat: add installation and update scripts, link agent instructions, and refine aliases)
}

link_agent_instructions "$HOME/.codex"
link_agent_instructions "$HOME/.cursor"
<<<<<<< HEAD
link_agent_instructions "$HOME/.config/github-copilot"
link_agent_instructions "$HOME/.config/opencode"
link_agent_instructions "$HOME/.claude" "CLAUDE.md"
=======
link_agent_instructions "$HOME/.config/agents"
link_agent_instructions "$HOME/.config/github-copilot"
link_agent_instructions "$HOME/.config/opencode"
>>>>>>> 8173c99 (feat: add installation and update scripts, link agent instructions, and refine aliases)
