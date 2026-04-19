cd ~/.config
git init

cat > .gitignore << 'EOF'
gh/
mozilla/
dconf/
gtk-3.0/
EOF

git add .
git commit -m "Initial commit of arch config"

gh auth login
gh repo create my-arch-config --public --source=. --remote=origin --push
git push

git status

