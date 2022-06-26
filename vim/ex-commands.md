# Tabs
set tabstop=4       # The width of a TAB is set to 4 (but is still \t)
set shiftwidth=4    # Indents will have a width of 4.
set softtabstop=4   # Sets the number of columns for a TAB.

set expandtab       # Expand TABs to spaces.
set et

set noexpandtab     # turn off expand tab (for reverting back to using tabs for Makefiles)
set noet

# Highlighting
set hlsearch        # highlight searches
:nohlsearch         # turn off search highlighting
:noh                # turn off search highlighting

# Numbering
set number      # turn on line numbering
set nonumber    # turn off line numbering
set nonu
set nu!

set relativenumber    # turn on relative line numbering
set rnu
set norelativenumber  # turn off relative line numbering
set nornu

# Other
set belloff=all    # turn off the flashing warning

:h       # get help with a command
:h :w    # get help with the write command


# Replace
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
