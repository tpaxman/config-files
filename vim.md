# Vim

### Useful Actions
```
ciw <CTRL-R> 0       # Replace word with yanked word
```

### Set Commands

```vimscript
set tabstop=4       # The width of a TAB is set to 4 (but is still \t)
set shiftwidth=4    # Indents will have a width of 4.
set softtabstop=4   # Sets the number of columns for a TAB.

set expandtab       # Expand TABs to spaces.
set et

set noexpandtab     # turn off expand tab (for reverting back to using tabs for Makefiles)
set noet

set hlsearch        # highlight searches
:nohlsearch         # turn off search highlighting
:noh                # turn off search highlighting

set number      # turn on line numbering
set nonumber    # turn off line numbering
set nonu
set nu!

set relativenumber    # turn on relative line numbering
set rnu
set norelativenumber  # turn off relative line numbering
set nornu

set belloff=all    # turn off the flashing warning

:h       # get help with a command
:h :w    # get help with the write command
```

### Mode Toggling

Description | Command
        --- | ---
`Esc`, | normal mode
`Ctrl-[` | normal mode
`Ctrl-o` | Normal mode for one command
`i` | insert mode at current character
`a` | insert mode at next character
`I` | insert mode at start of line
`A` | insert mode at end of line
`v`  | "regular" visual mode (i.e. at current character)
`V`  | "line" visual mode (i.e. at start of line)
`Ctrl-v` | "block" visual mode  (for block selection)
`:` | command mode
`h` | move left one character
`j` | move down one character
`k` | move up one character
`l` | move right one character
`w` | move to start of next word
`W` | move to start of next character block
`e` | move to end of next word
`E` | move to end of next character block
`b` | move to start of previous word
`B` | move to start of previous character block
`0` | move to start of line
`$` | move to end of line
`gg` | start of document
`G` | end of document
`22gg` | move to line 22
`x` | delete current character
`dd` | delete current line
`D` | delete from cursor to line end
    - delete characters
`diw` | current word
`de` | from cursor to end of word
`dw` | from cursor up to next word
`db` | from cursor to beginning of word
`dt<character>` | up to character
    - delete neighboring character
`dh` | to the left
`dl` | to the right
- Replace
`r <character>` | replace current character
`c` (puts vim into Insert Mode) | change text (in the direction that follows)
`ci"` | change within quotation marks
`ciw` | change within word
`ce` | change to end of word
`C` (puts vim into Insert Mode) | change text to end of line
`y` | yank (copy)
`y$` | yank (copy) to end of line
`"+y<move>` | copy to Windows clipboard

### Search

Search for word
`/` searches forward
`?` searches backward
`*` searches current word forward
`#` searches current word backward
`n` moves to next match
`N` moves to previous match
Find and replace
`:s/foo/bar/g`
Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.

`:%s/foo/bar/g`
Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.

`:%s/foo/bar/gc`
Change each 'foo' to 'bar', but ask for confirmation first.

`:%s/\<foo\>/bar/gc`
Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.

`:%s/foo/bar/gci`
Change each 'foo' (case insensitive due to the `i` flag) to 'bar'; ask for confirmation.

`:%s/foo\c/bar/gc` is the same because `\c` makes the search case insensitive.
This may be wanted after using `:set noignorecase` to make searches case sensitive (the default).

`:%s/foo/bar/gcI`
Change each 'foo' (case sensitive due to the `I` flag) to 'bar'; ask for confirmation.

`:%s/foo\C/bar/gc` is the same because `\C` makes the search case sensitive.
This may be wanted after using `:set ignorecase` to make searches case insensitive.

- [replace something with a newline](https://stackoverflow.com/questions/71323/how-to-replace-a-character-by-a-newline-in-vim): use `\r` in the replace slot.

[source](https://vim.fandom.com/wiki/Search_and_replace)

### Normal Mode Editing

Navigation ([src](https://vim.fandom.com/wiki/Moving_around))
    
 
    
    
        
| | Char | Word | CharBlock | Line |
|---|---|---|---|---|---|---|
|RIGHT | l | w | W | e | E | $ |
|LEFT  | h | b | B |   |   | 0 |
|UP    | k ||||||
|DOWN  | j ||||||

### Add a color theme to ~/.vim/colors

```bash
mkdir ~/.vim/colors
curl https://raw.githubusercontent.com/ajmwagar/vim-deus/master/colors/deus.vim > ~/.vim/colors/deus.vim
echo "colors deus" >> ~/.vimrc
```

## RESOURCES:

- All Vim colon commands: https://gist.githubusercontent.com/0x0dea/da0758d9562cf32baebf/raw/5bb3e81b203c70c2c01c37b1e69813aeeb5fedc9/ex_cmds
- List of a bunch of vim themes: https://github.com/rafi/awesome-vim-colorschemes
- Autoindenting: http://vimdoc.sourceforge.net/htmldoc/options.html#'autoindent'
- Cheat sheet: https://vim.rtorr.com/
- Summary/tutorial: https://www.digitalocean.com/community/tutorials/installing-and-using-the-vim-text-editor-on-a-cloud-server
- comprehensive commands: https://www.keycdn.com/blog/vim-commands
- Replace tab with 4 space: https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
