#!/usr/bin/env zsh
echo "in: 01-backup-config.sh"

source $ZDOTDIR/functions.zsh
cd $HOME
ls -la

echo "--------------------------------------"
DRY="false"
echo "DRY="$DRY
SRC="/home/m/.config/"
echo "SRC="$SRC
DST="/a/linux/current/.config_backup/"
echo "DST="$DST
echo "--------------------------------------"
f_pause

mkdir -p "$DST"
ls -la $DST
ls -la
f_pause


opts=(
  -rtvvL --delete               
  --exclude=".git/"             
  --exclude="themes/"
  --exclude="cache/"
  --exclude="dconf/"
  --exclude="gtk-3.0/"
  --exclude="mozilla/"
  --exclude="BraveSoftware/"
  --exclude="tmp/"
)

if $DRY; then
  opts+=(--dry-run)
fi

echo "${opts[@]}"
echo "----------------------------"

rsync "${opts[@]}" "$SRC" "$DST"
#rsync "${opts[@]}" "/home/m/.config" "/a/linux/current/.config_backup"
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
