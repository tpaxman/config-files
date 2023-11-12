# Shell settings - do not allow file overwrite
set -o noclobber

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

# Overrides
alias grep='grep --color=auto'
alias diff='diff -y --color=auto'

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

# PAT
alias pat='cat ~/pat | clip.exe'
alias patpush='cat ~/pat | clip.exe; git push'
alias build-pandas='python -m pip install -ve . --no-build-isolation --config-settings editable-verbose=true'

# Cat with color:
alias ccat='highlight -O ansi'
