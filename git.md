# Git

## Initialize Repo

```
git init
git add .
git commit -m "abc"
```

## Clone bare repo

`git clone --bare /path/to/repo`

## Setup Remote

```
git remote add origin <remote_repository_url>
git push -u origin master
```

## Diff

https://git-scm.com/docs/git-diff

- See complete history of a file: `git log --follow -p -- path-to-file`

> This will show the **entire** history of the file (including history beyond renames and with diffs for each change). In other words, if the file named `bar` was once named `foo`, then `git log -p bar` (without the `--follow` option) will only show the file's history up to the point where it was renamed -- it won't show the file's history when it was known as `foo`.  Using `git log --follow -p bar` will show the file's entire history, including any changes to the file when it was known as `foo`. The `-p` option ensures that diffs are included for each change.  [source](https://stackoverflow.com/questions/278192/view-the-change-history-of-a-file-using-git-versioning#:~:text=Using%20git%20log%20%2D%2Dfollow,are%20included%20for%20each%20change.)

- [View same file, different branches:](https://stackoverflow.com/questions/38664421/how-do-i-call-git-diff-on-the-same-file-between-2-different-local-branches/) `git diff branchA branchB -- file.py`
- View same file, different branches if you are in branchA: `git diff branchB file.py`
- Different files, different branches: `git diff develop:foo.txt master:bar.txt`
- Two folders: git diff branchA branchB -- folder
- Compact summary of difference between a folder in current branch and another branch: git diff --compact-summary branchB -- folder
- Treat ambiguous filename and branchname:
    - Treat as a branch name: `git diff ambiguous_name -- `
    - Treat as a file name: `git diff -- ambiguous_name`

## Add or [Unstage](https://clubmate.fi/git-removing-files-from-the-staging-area-and-the-tree/)

- add all: `git add -A`
- add modified files: `git add -u` or `git add --update`
- unstage a file that was added: `git reset HEAD <filename>`
- unstage everything added: `git reset HEAD`

## Configuration

### Configure line endings

#### Windows vs. Linux: https://barryvanveen.nl/blog/52-solving-inconsistent-line-endings-within-a-git-repository

#### Example .gitattributes file: https://github.com/swisnl/gists/blob/master/gitattributes/.gitattributes

#### GitHub answer: https://help.github.com/en/github/using-git/configuring-git-to-handle-line-endings\#refreshing-a-repository-after-changing-line-endings

#### Wikipedia - Newline: https://www.wikiwand.com/en/Newline

#### HTML text files - EOL: http://peterbenjamin.com/seminars/crossplatform/texteol.html

#### issues with autocrlf: https://www.edwardthomson.com/blog/git\_for\_windows\_line\_endings.html

#### Simple (reliable or not?) blog post: https://jessitron.com/2019/11/11/line-endings-in-git/

### Configure user details

#### \$ git config --global \[user.name\](http://user.name/) "Your name here"

#### \$ git config --global \[user.email\](http://user.email/) "\[your\_email\@example.com\](mailto:your\_email\@example.com)"

#### git config credential.helper store


- untrack files that are already in repo:
    - best way: `git update-index --assume-unchanged <file>` ([source](https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore))
    git rm --cached <file>
    git rm -r --cached <folder>

## Delete and prune branches

### Delete branch locally and remotely

    git branch -d branchname
    git push -d origin branchname

### Prune deleted branches

`git fetch --prune` or `git fetch -p`

## Diffs

### Diffs between words only

`dw = diff --ignore-cr-at-eol --word-diff-regex="[^[:space:],]+"`

### Navigating long diffs

    u: go up half page
    d: go down half page
    G: jump to last line
    h: display help

[source](https://stackoverflow.com/questions/32469204/scrolling-down-git-diff-from-mac-terminal)

## Finding files

### Show files in an old commit:

    git show --pretty="" --name-only 62c856a

### Look at file in old commit

    git show <commit>:path/to/file

### Find out when file got deleted

[source](https://stackoverflow.com/questions/7203515/git-how-to-find-a-deleted-file-in-the-project-commit-history)

    git log --all --full-history -- <path-to-file>

