# Nano

## Configuration

Order of precedence for config files:

1. command line
2. home: `~/.nanorc`
3. system: `/etc/nanorc`

Location of system settings:

- Linux: `/etc/nanorc`
- Windows: `/c/Users/<username>/AppData/Local/Programs/Git/etc/nanorc`

Tab size

```bash
# command line:
nano --tabsize 4 file.md
nano -T 4 file.md`

# nanorc:
set tabsize 4
```

Tabs-to-spaces

```bash
# command line
nano --tabstospaces file.md
nano -E file.md

# nanorc
set tabstospaces
```

Wrap settings

```
# nanorc: 
set nowrap
set softwrap
```

Sources:
- https://wiki.gentoo.org/wiki/Nano/Basics_Guide
- https://phoenixnap.com/kb/use-nano-text-editor-commands-linux

## Navigation

- move forward one character: `Ctrl+F (^F)`
- move back one character: `Ctrl+B (^B)`
- move forward one word: `Ctrl+Space (^Space)`
- move back one word: `Alt+Space (M-Space)`
- move to the previous line: `Ctrl+P (^P)`
- move to the next line: `Ctrl+N (^N)`
- move to the next page: `Ctrl+V (^V)`
- move to the previous page: `Ctrl+Y (^Y)`
- move to the beginning of the line: `Ctrl+A (^A)`
- move to the end of the line: `Ctrl+E (^E)`

## Copy-Paste

- Copy: `Alt-6 (Esc + 6)`
- Cut: `Ctrl-K (Esc Esc K)`
- Paste: `Ctrl-U`
- Set mark: `Alt-A`# Nano Key Commands

## File handling
Ctrl+S	Save current file
Ctrl+O	Offer to write file ("Save as")
Ctrl+R	Insert a file into current one
Ctrl+X	Close buffer, exit from nano

## Editing
Ctrl+K	Cut current line into cutbuffer
Alt+6	Copy current line into cutbuffer
Ctrl+U	Paste contents of cutbuffer
Alt+T	Cut until end of buffer
Ctrl+]	Complete current word
Alt+3	Comment/uncomment line/region
Alt+U	Undo last action
Alt+E	Redo last undone action

Ctrl-6-E-K  Delete from cursor to end of line
Ctrl-6-A-K  Delete from cursor to start of line

## Search and replace
Ctrl+Q	Start backward search
Ctrl+W	Start forward search
Alt+Q	Find next occurrence backward
Alt+W	Find next occurrence forward
Alt+R	Start a replacing session

## Deletion
Ctrl+H	Delete character before cursor      
Ctrl+D	    Delete character under cursor
Ctrl+Shift+Del	Delete word to the left
Ctrl+Del	Delete word to the right
Alt+Del	Delete current line

## Operations
Ctrl+T  Run a spell check
Ctrl+J	Justify paragraph or region
Alt+J	Justify entire buffer
Alt+B	Run a syntax check
Alt+F	Run a formatter/fixer/arranger
Alt+:	Start/stop recording of macro
Alt+;	Replay macro

## Moving around
Ctrl+B	One character backward
Ctrl+F	One character forward
Ctrl+←	One word backward
Ctrl+→	One word forward
Ctrl+A	To start of line
Ctrl+E	To end of line
Ctrl+P	One line up
Ctrl+N	One line down
Ctrl+↑	To previous block
Ctrl+↓	To next block
Ctrl+Y	One page up
Ctrl+V	One page down
Alt+\	To top of buffer
Alt+/	To end of buffer

## Special movement
Alt+G	Go to specified line
Alt+]	Go to complementary bracket
Alt+↑	Scroll viewport up
Alt+↓	Scroll viewport down
Alt+<	Switch to preceding buffer
Alt+>	Switch to succeeding buffer

## Information
Ctrl+C	Report cursor position
Alt+D	Report word/line/char count
Ctrl+G	Display help text

## Various
Alt+A	Turn the mark on/off
Tab	Indent marked region
Shift+Tab	Unindent marked region
Alt+N	Turn line numbers on/off
Alt+P	Turn visible whitespace on/off
Alt+V	Enter next keystroke verbatim
Ctrl+L	Refresh the screen
Ctrl+Z	Suspend nano

source: https://www.nano-editor.org/dist/latest/cheatsheet.html
