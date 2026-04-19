#!/usr/bin/env zsh

gh auth status
git status
git add .

git commit -m "$(date -Iseconds)"
git push
