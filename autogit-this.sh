#!/usr/bin/env zsh
## Updated ArchReal 2026-04-21 11:47 Tue
local SCRIPT_PATH="${(%)-%N}"
echo "Start: $SCRIPT_PATH"

source $ZDOTDIR/functions.zsh

gh auth status |bat
f_pause
git status -v
f_pause
git add . -v
f_pause
git commit -m "$(date -Iseconds)" -v
f_pause
git push -v
