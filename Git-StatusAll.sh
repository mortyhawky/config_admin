#!/usr/bin/env zsh
## Updated ArchReal 2026-04-24 09:08 Fri
local SCRIPT_PATH="${(%)-%N}"
echo "Start: $SCRIPT_PATH"
source $ZDOTDIR/functions.zsh
#all functions in $ZDOTDIR/funcitons.zsh is prefixed with f_
command -v bat >/dev/null && BAT=bat || BAT=cat
#return
#f_pause

# entry point
#clear
SCRIPT_DIR=${0:A:h}   # just the directory
SCRIPT_NAME=${0:t}    # :t = tail = just the filename
echo "SCRIPT_DIR="$SCRIPT_DIR
echo "SCRIPT_NAME="$SCRIPT_NAME
echo
#pause
#return

# Top-level directories
all_folders=("$XDG_CONFIG_HOME"/*(/N))
# Folders that contain a .git directory
git_folders=()

for dir in "${all_folders[@]}"; do
  if [[ -d "$dir/.git" ]]; then
    git_folders+=("$dir")
  fi
done

# Print result
echo "\n----- GIT FOLDERS -----"
for dir in "${git_folders[@]}"; do
  echo "$dir"
done
#f_pause
#return

for dir in "${git_folders[@]}"; do
    clear
    echo "\n----------------------------------\n"
    cd "$dir"
    pwd
    git status 
    echo "\n----------------------------------\n"
    f_pause
done
