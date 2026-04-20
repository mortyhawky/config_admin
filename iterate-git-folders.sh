#!/usr/bin/env zsh

pause() {
  read -sk1 "?Press any key to continue..."
  echo
}

function git_push {
  git add . -vv |bat
  git commit -m "$(date -Iseconds)" -v
  git push --dry-run
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
echo "in: "$abs_path_r
pause

# Get only top-level directories into an array
folders=("$XDG_CONFIG_HOME"/*(/N))

# Print the results
print "Top-level folders in $CONFIG_DIR:"
for dir in "${folders[@]}"; do
  echo $dir
done

pause
#return



for dir in "${folders[@]}"; do
    echo "----------------------------------"
    print "${dir}"          # :t gives only the folder name (basename)
    cd "$dir"
    echo "Now in: " $dir
    if [[ -d ".git" ]]; then
      echo "Is a git repo"
      pause
      git_push
    else
      echo "Not a git repo"
    fi
    #pause
    #return
    #echo "sleep 1..."
    #sleep 1
done
