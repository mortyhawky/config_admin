git clone https://github.com/mortyhawky/config_admin.git $XDG_CONFIG_HOME/admin

## new repo using CLI:
cd ~/.config/admin

cat > .gitignore << 'EOF'
dconf/
gh/
gtk-3.0/
mozilla/
EOF

echo "#### Admin" >> README.md

git init
git add -Av
git commit -m "Arch: $(date)"

gh auth status
gh auth login
gh repo create config_admin --public --source=. --remote=origin --push
git push -u origin main

git status

### test

Hello this  
is  
a  
test

Remeber to  
use 2 spaces  
at the end of lines
asdf  
sdfg  
dfgh  
