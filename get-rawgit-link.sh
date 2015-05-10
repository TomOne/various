#!/bin/bash

ghUser=TomOne
ghRepositoryName=various

# Stash files to prevent accidentally adding files unrelated to the icon
git stash --quiet

git add "$1"
filePathInRepo="$(git status --porcelain --untracked-files=no | cut -c4- | head -1)"
git commit --quiet -m "Add icon: $filePathInRepo"
lastCommitHash="$(git log -1 --pretty=format:%H)"

git stash pop --quiet

git push


# TODO: complete
# git remote -v | sed -e 's/origin.*github\.com[\/:](.*)\.git.*/ui/' | head -1

echo "The corresponding RawGit URL is:"
echo "https://cdn.rawgit.com/$ghUser/$ghRepositoryName/$lastCommitHash/$filePathInRepo"
