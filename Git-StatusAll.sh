#!/usr/bin/env zsh

clear 
source $ZDOTDIR/functions.zsh

programs=(
  "admin"
  "alacritty"
  "dmenu"
  "dwm"
)

cd $XDG_CONFIG_HOME
ls -la
for prg in $programs; do
  path=$XDG_CONFIG_HOME/$prg
  echo $path
  #/usr/bin/rm -ri $path
  cd $path
  /usr/bin/git status
done

