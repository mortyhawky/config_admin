#!/usr/bin/env zsh
## Updated: 2026-04-21 13:09 Tue
local SCRIPT_PATH="${(%)-%N}"
echo "Start: $SCRIPT_PATH"
source $ZDOTDIR/functions.zsh
#all functions in $ZDOTDIR/funcitons.zsh is prefixed with f_
BAT="cat"
command -v bat >/dev/null && BAT="bat"

echo "command:  gh auth status"
gh auth status |$BAT
f_pause

echo "command:  git status"
git status  |grep -i --color=always modified |$BAT

STATE="$(git status --porcelain | grep '^ M')"
echo "STATE=$STATE"
if [[ -z "$STATE" ]]; then
  return
fi
f_pause

echo "command:  git add ."
git add . -v |$BAT
f_pause

echo "command:  git commit -m \"$(date -Iseconds)\" "
git commit -m "$(date -Iseconds)" -v |$BAT
f_pause

echo "command:  git push"
git push -v |$BAT
