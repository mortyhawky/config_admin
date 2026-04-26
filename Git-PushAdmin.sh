#!/usr/bin/env zsh


# #########################################################
# INIT
# #########################################################
local SCRIPT_PATH="${(%)-%N}"
echo "Start: $SCRIPT_PATH"
# All my functions in functions.zsh are prefixed with f_
# use: 
# clear && grep --color=always "function " /home/m/.config/zsh/functions.zsh |g --invert-match ZDOTDIR
# alias lf='f_listFunctions'
source $ZDOTDIR/functions.zsh


# #########################################################
# FUNCTIONS
# #########################################################
function git_sasc() {
  git status --porcelain |bat
  git add -Av |bat |grep --color=always "add"
  git status --porcelain |bat
  git commit -m "$(date)" |grep --color=always "git push"
}


# #########################################################
# MAIN
# #########################################################
  clear
  git_sasc
  f_pressAnyKey
  git_sasc
# END MAIN
