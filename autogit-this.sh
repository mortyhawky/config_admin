#!/usr/bin/env zsh
## Updated ArchReal 2026-04-21 12:12 Tue
local SCRIPT_PATH="${(%)-%N}"
echo "Start: $SCRIPT_PATH"

source $ZDOTDIR/functions.zsh


echo "command:  gh auth status"
gh auth status |bat
f_pause

echo "command:  git status"
git status  |grep -i --color=always modified |bat

echo "command:  git status"
STATE=$(git status |grep "modified")
echo "STATE=$STATE"
f_pause


echo "command:  git add ."
git add . -v |bat
f_pause

echo "command:  git commit -m \"$(date -Iseconds)\" "
git commit -m "$(date -Iseconds)" -v |bat
f_pause

echo "command:  git push"
git push -v |bat
