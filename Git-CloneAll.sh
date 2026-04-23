#!/usr/bin/env zsh

programs=(
  "admin"
  "alacritty"
  "dmenu"
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

