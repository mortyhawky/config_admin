#!/usr/bin/env zsh
## Updated: 2026-04-25 13:20 Sat
set -e
#all functions in $ZDOTDIR/funcitons.zsh is prefixed with f_
source $ZDOTDIR/functions.zsh
local SCRIPT_PATH="${0}"

#####################################################
## ENTRY POINT
#####################################################
clear
echo "---- ---- Start: $SCRIPT_PATH ---- ----"

# if bat doesn't exist use cat
BAT="---"
echo "\$BAT"=$BAT
command -v bat >/dev/null && BAT=bat || BAT=cat
echo "\$BAT"=$BAT
#all functions in $ZDOTDIR/funcitons.zsh is prefixed with f_
#f_pressAnyKey


#####################################################
##  FUNCTIONS
#####################################################
function git_pull() {
  git status
  #state=$(git status |grep -io "modified")
  #printf "\033[38;5;196m $state \033[0m \n"
  #if [[ "$state" == "modified" ]]; then
  #  printf "\033[38;5;196m---> Can't pull, manually intervention needed! \033[0m \n"
  #  return
  #fi
  ##git pull
  #f_pressAnyKey
  #return
}
# END of function git_pull()


#####################################################
# MAIN
#####################################################
# Get only top-level directories into an array
folders=("$XDG_CONFIG_HOME"/*(/N))

  for dir in "${folders[@]}"; do
    echo "#####################################################\n"
    cd "$dir"
    printf "\033[32m Now in: ${dir} \033[0m \n"
    if [[ -d ".git" ]]; then
      echo " ${dir:t} is a git repo.      --> Calling function git_pull()"
      git_pull
    else
      printf " ${dir:t} is \033[32m Not \033[0m a git repo.  --> skipping."
    fi
    f_pressAnyKey
  done
  # END of for loop
# END of MAIN
