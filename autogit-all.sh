#!/usr/bin/env zsh
## Updated: 2026-04-21 12:54 Tue
source $ZDOTDIR/functions.zsh
#all functions in $ZDOTDIR/funcitons.zsh is prefixed with f_

BAT="cat"
command -v bat >dev/null && BAT="bat"

function git_push() {
  if ! git status --porcelain | grep -q .; then
    return
  fi

  command -v bat >/dev/null && BAT=bat || BAT=cat

  git add -A -v | $BAT
  git commit -m "$(date -Iseconds)" -v | $BAT
  git push | $BAT
}

# entry point
clear
abs_path_r=${0:A}     # absolute resolved symlinks
abs_path_u=${0:P}     # absolute unreolved symlinks
SCRIPT_DIR=${0:A:h}   # just the directory
SCRIPT_NAME=${0:t}    # :t = tail = just the filename
echo "abs_path_r="$abs_path_r
echo "abs_path_u="$abs_path_u
echo "SCRIPT_DIR="$SCRIPT_DIR
echo "SCRIPT_NAME="$SCRIPT_NAME
echo
#echo "in: "$abs_path_r
#pause
#return

# Get only top-level directories into an array
folders=("$XDG_CONFIG_HOME"/*(/N))

# Print the results
print "Top-level folders in $XDG_CONFIG_HOME:"
for dir in "${folders[@]}"; do
  echo "$dir"
done
#pause
#return



for dir in "${folders[@]}"; do
    echo "----------------------------------"
    echo
    print "${dir}"          # :t gives only the folder name (basename)
    cd "$dir" || continue
    echo "Now in foler: " $dir
    if [[ -d ".git" ]]; then
      echo " ${dir:t} is a git repo.      --> Calling function git_push"
      git_push
    else
      echo " ${dir:t} is Not a git repo.  --> skipping."
    fi
    #all functions in $ZDOTDIR/funcitons.zsh is prefixed with f_
    #f_pause
done
