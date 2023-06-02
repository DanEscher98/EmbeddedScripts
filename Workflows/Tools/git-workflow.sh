git init
git branch -m master main
git add .
git commit -a -m "First commit"

gh repo create "repo"
git remote add origin https://github.com/<name>/<repo>.git
git pull origin main
git push -f origin main
git pull origin master --allow-unrelated-histories
git config --global credential.helper store
git config --global --unset credential.helper
git config --global user.email email@example.com
git push --set-upstream origin main

# In Tree, remove nodes included in .gitignore
git rm -r --cached .
git add .
git commit -m "Drop files from .gitignore"

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Push conflict by oversized file
git filter-branch --index-filter \
	'git rm -r --cached -ignore-unmatch <big_file>' -f HEAD
git pull
git commit -am "removeds oversized file"

# Create alias to list conflicts
git config --global alias.conflicts "diff --name-only --diff-filter=U --relative"

# Modify the previous commit without changing the commit message
git commit --amend --no-edit

# Delete a file with sensitive data
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch PATH-TO-FILE" \
  --prune-empty --tag-name-filter cat -- --all
git push --force --verbose --dry-run
git push --force
