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
