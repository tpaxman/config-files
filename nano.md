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
- Set mark: `Alt-A`