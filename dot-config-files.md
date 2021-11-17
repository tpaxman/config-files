# .bash_profile (Git Bash for Windows)

```
alias g='git'
alias ..='cd ..'
alias ipython='winpty ipython'
alias python='winpty python'
```
 
# .inputrc

```bash
set bell-style none
set editing-mode vi
```

# .nanorc

```bash
set tabsize 4
set tabstospaces
```

# .vimrc

```bash
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set relativenumber
set hlsearch
set ai
```

# .bashrc

This file contains some functions for use only on Ubuntu on Windows (WSL)

```bash
# Shell settings - do not allow file overwrite
set -o noclobber

# Grep with color:
alias cgrep='grep --color=auto'

# Cat with color:
alias ccat='highlight -O ansi'

# Less with color:
cless () {
    ccat $1 | less -R
}

# Print out the contents of a docx file in markdown
docx () {
    pandoc $1 -t markdown 
}

# Accept the first line of std out as a filename and open it in Vim:
vim_first () {
    vim $(ls -t $1 | head -n 1)
}

# General aliases:
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'
alias ..='cd ..'
alias ..ll='cd ..; ll'
alias cl='clear;ll'

# Aliases for Ubuntu on Windows:
alias start='cmd.exe /C start'
alias win='cd /mnt/c/Users/'
```

# .gitattributes - template

```
* text=auto
```

# .gitconfig

```
## Nice log output:
[log]
date = relative
[format]
pretty = format:%C(auto,yellow bold)% h %C(auto,blue)%>(11,trunc)% ad %C(auto,green)%<(14,trunc)%aN%C(auto,white)% %s% C(auto,red reverse)%D

# Maybe?:
# h - commit
# ad - date
# aN - author
# s - message
# D - branch

#pretty = format:%C(auto,yellow bold)%h%C(auto, white)% G? %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(9,trunc)%aN%C(auto,white)%<(38,trunc) %s% C(auto,red reverse)%D
#pretty = format:%C(auto,yellow bold)%h%C(auto, white)% G? %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(9,trunc)%aN%C(auto,white)%<(50,trunc) %s% C(auto,red reverse)%gD%D
# (Source: https://stackoverflow.com/questions/1441010/the-shortest-possible-output-from-git-log-containing-author-and-date)

## Status
[color "status"]
	header = normal
	added = green bold reverse
	#updated = red bold
	changed = red bold reverse
	untracked = red
	nobranch = red

[color "branch"]
	current = yellow bold reverse
	local = yellow bold
	remote = red bold
	plain = normal
	
[color "diff"]
	plain = white bold
	meta = cyan bold
	frag = cyan bold
	old = red bold
	new = green bold
	commit = yellow
	whitespace = normal red
	
## Aliases:
[alias]
# logs
#l = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short
l = log -35
lg = l --graph

a = add
au = add -u; git s
ap = add -p
aa = add .
ac = !git add -A && git commit -m
c = commit --verbose
ca = commit -a --verbose
cm = commit -m
cam = commit -a -m
m = commit --amend --verbose

d = diff
ds = diff --stat
dcs = diff --compact-summary
dw = diff --ignore-cr-at-eol --word-diff-regex="[^[:space:],]+"
dc = diff --cached
a = add
ap = add -p
aa = add .
c = commit --verbose
ca = commit -a --verbose
cm = commit -m
cam = commit -a -m
m = commit --amend --verbose

# https://stackoverflow.com/questions/2928584/how-to-grep-search-committed-code-in-the-git-history
oldies = rev-list --all

s = status -s
co = checkout
cob = checkout -b
# list branches sorted by last modified
b = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"

# tracked files (must type a branch name after)
tf = ls-tree -r --name-only

# list aliases
la = "!git config -l | grep alias | cut -c 7-"
[user]
	name = tpaxman
[core]
	autocrlf = true
	editor = vim
```
