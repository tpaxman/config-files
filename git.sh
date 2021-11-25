# Git

# initialize repo
git init

# add files in current folder to repo
git add .

# commit with a message
git commit -m "abc"

# clone a bare repo
git clone --bare /path/to/repo

# setup remote repo
git remote add origin <remote_repository_url>

# push upstream from local to remote repo
git push -u origin master

# show history of a file 
git log -p bar

# View diffs across branches and files (https://stackoverflow.com/questions/38664421/how-do-i-call-git-diff-on-the-same-file-between-2-different-local-branches)
git diff branchA branchB -- file.py      # same file but different branches
git diff branchB file.py                 # same file, different branches (if you are already in branchA)
git diff develop:foo.txt master:bar.txt  # Different files, different branches
git diff branchA branchB -- folder       # diff between folders
git diff --compact-summary branchB -- folder   # diff summary between folder between current branch and other branch
git diff ambiguous_name --      #  Treat ambiguous name as a branch name
git diff -- ambiguous_name      #  Treat ambiguous name as a file name
diff --ignore-cr-at-eol --word-diff-regex="[^[:space:],]+"    # Diffs between words only

## Add or Unstage (https://clubmate.fi/git-removing-files-from-the-staging-area-and-the-tree/)
git add -A   # add all
git add -u   # add modified files
git reset HEAD <filename>   # unstage a file that was added
git reset HEAD              # unstage everything added

# untrack files that are already in repo:https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore
git update-index --assume-unchanged <file>    # best way
git rm --cached <file>                        # other way
git rm -r --cached <folder>                   # other way

### Delete branch locally and remotely
git branch -d branchname          # delete branch locally
git push -d origin branchname     # push deleted branch to remote
git fetch --prune                 # prune deleted branches (--prune = -p)

## Show files
git show --pretty="" --name-only 62c856a         # Show files in an old commit:
git show <commit>:path/to/file                   # Look at file in old commite
git log --all --full-history -- <path-to-file>   # Find out when file got deleted (https://stackoverflow.com/questions/7203515/git-how-to-find-a-deleted-file-in-the-project-commit-history)

# Configure user details
git config --global user.name "user_name"
git config --global user.email "email@email.com"

#    Configure line endings
#     Windows vs. Linux: https://barryvanveen.nl/blog/52-solving-inconsistent-line-endings-within-a-git-repository
#     Example .gitattributes file: https://github.com/swisnl/gists/blob/master/gitattributes/.gitattributes
#     GitHub answer: https://help.github.com/en/github/using-git/configuring-git-to-handle-line-endings\ refreshing-a-repository-after-changing-line-endings
#     Wikipedia - Newline: https://www.wikiwand.com/en/Newline
#     HTML text files - EOL: http://peterbenjamin.com/seminars/crossplatform/texteol.html
#     issues with autocrlf: https://www.edwardthomson.com/blog/git\_for\_windows\_line\_endings.html
#     Simple (reliable or not?) blog post: https://jessitron.com/2019/11/11/line-endings-in-git/
#     git config credential.helper store
