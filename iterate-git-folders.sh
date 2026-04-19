#!/usr/bin/env zsh

# Set XDG_CONFIG_HOME if not already set
#echo "XDG_CONFIG_HOME="$XDG_CONFIG_HOME
#: ${XDG_CONFIG_HOME:=$HOME/.config}
#echo "XDG_CONFIG_HOME="$XDG_CONFIG_HOME
#return

CONFIG_DIR="$XDG_CONFIG_HOME"

# Check if directory exists
if [[ ! -d "$CONFIG_DIR" ]]; then
    print -u2 "Error: Directory '$CONFIG_DIR' does not exist."
    exit 1
fi

# Get only top-level directories into an array
folders=("$CONFIG_DIR"/*(/N))

function Do_Git_Work {
  gh auth status
  git status
  #git pull
  git add .
  git commit -m "$(date -Iseconds)"
  git push
}
# Print the results
print "Top-level folders in $CONFIG_DIR:"
for dir in "${folders[@]}"; do
    #echo $dir 
    print "${dir:t}"          # :t gives only the folder name (basename)
    cd "$dir"
    echo "Now in: " $dir
    Do_Git_Work
    return
done
