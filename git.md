#   Git

## Snippets

### SETUP A REPOSITORY AND REMOTE

```bash
git init                          # initialize repo
git clone --bare /path/to/repo    # clone a bare repo
git remote add origin <repo_url>  # setup remote repo
git push -u origin master         # push upstream from local to remote repo
```

### ADD FILES

```bash
git add .             # add files in current folder to repo
git add -A            # add all
git add -u            # add modified files
```

# COMMIT
```
git commit -m "abc"   # commit with a message
git commit --amend -m "update note"   # edit the previous commit message

git add forgotten-file.txt
git commit --amend --no-edit          # amend previous commit to include a file you forgot

```
### REVERT/RESET

```bash
git reset HEAD <filename>    # unstage a file that was added
git reset HEAD               # unstage everything added
git revert HEAD              # revert back to the previous commit without erasing subsequent work
git revert laf452d           # revert back to previous commit
```

### REMOVE FILES

```bash
git update-index --assume-unchanged <file>    # untrack files that are already in repo: best way [2]
git rm --cached <file>                        # untrack files that are already in repo: other way
git rm -r --cached <folder>                   # untrack files that are already in repo: other way
```

### DELETE BRANCHES

```bash
git branch -d branchname          # delete branch locally
git push -d origin branchname     # push deleted branch to remote
git fetch --prune                 # prune deleted branches (--prune = -p)
```

### DIFF FILES AND BRANCHES 

```bash
git diff branchA branchB -- file.py            # same file but different branches [3]
git diff branchB file.py                       # same file, different branches (if you are already in branchA)
git diff develop:foo.txt master:bar.txt        # Different files, different branches
git diff branchA branchB -- folder             # diff between folders
git diff --compact-summary branchB -- folder   # diff summary between folder between current branch and other branch
git diff ambiguous_name --                     #  Treat ambiguous name as a branch name
git diff -- ambiguous_name                     #  Treat ambiguous name as a file name
git diff --ignore-cr-at-eol --word-diff-regex="[^[:space:],]+"    # Diffs between words only
git diff --staged      # show differences in the staged files
```

### SHOW FILE CONTENTS

```bash
git show --pretty="" --name-only 62c856a         # Show files in an old commit:
git show <commit>:path/to/file                   # Look at file in old commite
git log --all --full-history -- <path-to-file>   # Find out when file got deleted [1]
git log -p bar                                   # show history of a file 
```

### CONFIGURE USER DETAILS

```bash
git config --global user.name "user_name"
git config --global user.email "email@email.com"
```

## RESOURCES:

[1] https://stackoverflow.com/questions/7203515/git-how-to-find-a-deleted-file-in-the-project-commit-history
[2] https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore
[3] https://stackoverflow.com/questions/38664421/how-do-i-call-git-diff-on-the-same-file-between-2-different-local-branches
[4] https://clubmate.fi/git-removing-files-from-the-staging-area-and-the-tree/


# Configure line endings
#     Windows vs. Linux: https://barryvanveen.nl/blog/52-solving-inconsistent-line-endings-within-a-git-repository
#     Example .gitattributes file: https://github.com/swisnl/gists/blob/master/gitattributes/.gitattributes
#     GitHub answer: https://help.github.com/en/github/using-git/configuring-git-to-handle-line-endings\ refreshing-a-repository-after-changing-line-endings
#     Wikipedia - Newline: https://www.wikiwand.com/en/Newline
#     HTML text files - EOL: http://peterbenjamin.com/seminars/crossplatform/texteol.html
#     issues with autocrlf: https://www.edwardthomson.com/blog/git\_for\_windows\_line\_endings.html
#     Simple (reliable or not?) blog post: https://jessitron.com/2019/11/11/line-endings-in-git/
#     git config credential.helper store
