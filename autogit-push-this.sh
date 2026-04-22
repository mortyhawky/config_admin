#!/usr/bin/env zsh
## Updated: 2026-04-21 13:09 Tue
local SCRIPT_PATH="${(%)-%N}"
echo "Start: $SCRIPT_PATH"
source $ZDOTDIR/functions.zsh
#all functions in $ZDOTDIR/funcitons.zsh is prefixed with f_
command -v bat >/dev/null && BAT='bat' || BAT='cat'
echo "Using: $(which $BAT)"
#return

echo "command:  gh auth status"
gh auth status |$BAT
f_pause

echo "command:  git status"
git status |$BAT
if ! git status --porcelain | grep -q .; then
  return
fi
f_pause

echo "command:  git add -A -v"
git add -A -v  |$BAT
f_pause

echo "command:  git commit -m \"$(date -Iseconds)\" "
git commit -m "$(date -Iseconds)" -v |$BAT
f_pause

echo "command:  git push"
git push -v |$BAT
