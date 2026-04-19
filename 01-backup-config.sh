#!/usr/bin/env zsh

clear
echo "----------------------------"
DRY="false"
echo "DRY="$DRY
SRC="$HOME/.config/"
echo "SRC="$SRC
DST="/a/linux/current/.config/"
echo "DST="$DST
echo "----------------------------"

mkdir -p "$DST"

opts=(
  -rtvvL --delete               
  --exclude='/cache/'           
  --exclude='/tmp/'             
  --exclude='/mozilla/'         
  --exclude='/alacritty/themes/'
  --exclude='/.git/'             
  --exclude='/dconf/'
  --exclude='/gtk-3.0/'
  #--exclude='01-backup-config.sh'
)

if $DRY; then
  opts+=(--dry-run)
fi

echo "${opts[@]}"
echo "----------------------------"

rsync "${opts[@]}" "$SRC" "$DST"
echo "READY!\n-------------\n\n"

# pm -Syu rsync
# -r          recursive
# -t          preserve timestamps (works)
# -v          verbose
# --delete    keep destination in sync (remove old files)
#
# -l          copy symlinks as symlinks (may fail on exFAT)
# -L          dereference symlinks (copy actual file contents)
#             This avoids broken backups.
