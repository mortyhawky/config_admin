#!/usr/bin/env zsh
## Updated: 2026-04-26 08:16 Sun

local SCRIPT_PATH="${(%)-%N}"
echo "Start: $SCRIPT_PATH"
# All my functions in functions.zsh are prefixed with f_
# use: 
# clear && grep --color=always "function " /home/m/.config/zsh/functions.zsh |g --invert-match ZDOTDIR
# alias lf='f_listFunctions'
source $ZDOTDIR/functions.zsh

# #########################################################
# ENTRY POINT
# #########################################################
clear
git status
#echo "------------------------"
git status --porcelain |bat
#echo
#git status --porcelain |bat |grep --color=always "M"
#git add -Av |bat |grep --color=always "add"
git add -Av |bat |grep --color=always "add"
git status --porcelain |bat
f_pressAnyKey
git commit -m "$(date)" |grep --color=always "git push"
f_pressAnyKey
