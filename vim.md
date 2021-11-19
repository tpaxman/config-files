# Vim

## Commands

All Vim colon commands
https://gist.githubusercontent.com/0x0dea/da0758d9562cf32baebf/raw/5bb3e81b203c70c2c01c37b1e69813aeeb5fedc9/ex_cmds

## Themes

List of a bunch of vim themes
https://github.com/rafi/awesome-vim-colorschemes

Add a theme manually

1. download ".vim" file, e.g.:
```https://raw.githubusercontent.com/ajmwagar/vim-deus/master/colors/deus.vim```

2. put in your the `vimfiles` folder (usually `~/.vim`):
```~/.vim/colors/deus.vim```

3. add this to your `~/.vimrc` file:
```colors deus```

## Options (set)

http://vimdoc.sourceforge.net/htmldoc/options.html#'autoindent'
Best links
[Cheat sheet](https://vim.rtorr.com/)
[Summary/tutorial](https://www.digitalocean.com/community/tutorials/installing-and-using-the-vim-text-editor-on-a-cloud-server)
[comprehensive commands](https://www.keycdn.com/blog/vim-commands)

## Configuration (`.vimrc`)

Set 4-spaces for tabs

```
# add to ~/.vimrc
set tabstop=4       # The width of a TAB is set to 4 (but is still \t)
set shiftwidth=4    # Indents will have a width of 4.
set softtabstop=4   # Sets the number of columns for a TAB.
set expandtab       # Expand TABs to spaces.
```
[stackoverflow explanation](https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim)

Highlight search

```
set hlsearch
```
## Mode Toggling

- Enter normal mode: `Esc`, `Ctrl-[`
- Enter insert mode:
    - at current character: `i`
    - at next character: `a`
    - at start of line: `I`
    - at end of line: `A`
- Enter visual mode
    - enter "regular" visual mode: `v` (i.e. at current character)
    - enter "line" visual mode: `V` (i.e. at start of line)
    - enter "block" visual mode: `Ctrl-v` (for block selection)
- Enter command mode: type `:`
- Insert mode --> normal mode (temporarily): `Ctrl-o` (lasts for one command and then goes back to insert mode)

## Revert to tabs for Makefiles

- type `:set noet` (for noexpandtab) 
- revert back by doing `:set et`

## Search
Turn off current search highlight
`:noh` or `:nohlsearch` ([stackoverflow](https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting))
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

## Normal Mode Editing

Navigation ([src](https://vim.fandom.com/wiki/Moving_around))
    
    - Move one space: left: `h`, down: `j`, up: `k`, right: `l`
    - Move one word:
        - start of next word: `w`
        - start of next character block: `W`
        - end of next word: `e`
        - end of next character block `E`
        - start of previous word: `b`
        or character block `B`
    - Line start/end
        - start of line: `0`
        - end of line: `$`
    - Document start/end
        - start of document: `gg`
        - end of document: `G`
- Deletion
    - delete current character: `x`
    - delete current line: `dd`
    - delete from cursor to line end: `D`
    - delete characters
        - current word: `diw`
        - from cursor to end of word: `de`
        - from cursor up to next word: `dw`
        - from cursor to beginning of word: `db`
        - up to character: `dt<character>`
    - delete neighboring character
    - to the left: `dh`
    - to the right: `dl`
- Replace
    - replace current character: `r <character>`
    - change text (in the direction that follows): `c` (puts vim into Insert Mode)
        - change within quotation marks: `ci"`
        - change within word: `ciw`
        - change to end of word: `ce`
    - change text to end of line: `C` (puts vim into Insert Mode)
 
    
    
        
| | Char | Word | CharBlock | Line |
|---|---|---|---|---|---|---|
|RIGHT | l | w | W | e | E | $ |
|LEFT  | h | b | B |   |   | 0 |
|UP    | k ||||||
|DOWN  | j ||||||
