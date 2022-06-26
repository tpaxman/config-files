
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
`/` | searches forward
`?` | searches backward
`*` | searches current word forward
`#` | searches current word backward
`n` | moves to next match
`N` | moves to previous match
