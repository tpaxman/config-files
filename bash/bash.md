# GNU/Linux

## COMMANDS

### Find

- find file: `find . -type f -name "test1.txt"`
- find files: `find . -type f -name "test*"`
- find directory: `find . -type d -name "some-dir"`
- case insensitive: `find . -type f -iname "test*"`
- files modified in last 10 mins: `find . -type f -mmin -10`
- files modified more than 1 min ago, less than 5 mins ago: `find . -type f -mmin +1 -mmin -5`
- find empty file: `find . -empty`
- find files over 5 MB: `find . -size +5M`
- find files over 5 KB: `find . -size +5k`
- find files over 5 GB: `find . -size +5G`
- list all file paths recursively: `find . -type f`

### Dpkg/apt

- see installed packages:`dpkg -l`
- uninstall package: `sudo apt-get remove packagename`
- uninstall package and config files: `sudo apt-get purge packagename`

### Grep

- highlight with color: https://linuxcommando.blogspot.com/2007/10/grep-with-color-output.html
- search all files of specific type in all subdirectories: `grep -r --include "*.py" <searchstring>`
- omit dash separators: `grep --no-group-separator`
- search the NOT condition (i.e. invert match) `grep -v`

### Less

- show line numbers: `less -N`

### Make

- Substitutions: `$(patsubst %,raw/%.csv,file smile tile)` --> `raw/file.csv raw/smile.csv raw/tile.csv`
- Implicit recipe (where `$*` is whatever the `%` is):
```bash
output/%.csv : src/script_to_do raw/%.zip
    python $^ $@ $*
```

- Print the recipe instead of running it (dry run): `make -n target-file.csv`
- [Use .RECIPEPREFIX += to allow multiple spaces instead of tabs in the makefile](https://docs.php.earth/interop/make/)
[Issues with Spaces](https://savannah.gnu.org/bugs/?712)

### Rename
- 'rename' syntax: `$ rename 's/<pattern>/<replacement>/'
- print out changes: `rename -v`
- dry run: `rename -n`
- reference groups in replacement: `$ rename -v -n 's/file_(\d+)/$1_file/' file_*` --> `rename(file_2020.txt, 2020_file.txt)`

### Sed

- print between lines: `sed -n '10,40p' filename.txt # prints lines 10 to 40`
- find and replace: `sed 's/old-text/new-text/g' input.txt`
- regex find and replace: `sed -E 's/^\s+/ - /g' file.txt`
- delete all empty/blank lines: `sed '/^$/d' /tmp/data.txt`

### Ubuntu

check Ubuntu version: `lsb_release -a`

### Safety nets for avoiding overwriting/inadvertent copying
- Set up noclobber to avoid overwriting files: `set -o noclobber` (add to .bashrc)
- Prompt when copying or moving (`-i` = 'interactive'): `cp -i`, `mv -i` (add to .bashrc: `alias cp='cp -i'`)

### Filename handling
- Open first file in an `ls`: `vim $(ls -t some-file-pattern*txt | head -n 1)`
- Find filename and pipe to Vim: `grep google= ~/.bashrc | sed -E 's/.*(\/mnt.*\.sh).*/\1/' | xargs -o vim`

### wc (Word count)

- Count lines in file: `wc -l filename.csv`
- Count lines in files: `wc -l data/*.csv`
- Count columns in csv file: `head -1 file.csv | sed 's/[^,]//g' | wc -c`

### Print with color

- `grep` with color: `grep --color=auto`
- `cat` with color: `highlight -O ansi`
- `less` with color: `cless () {ccat $1 | less -R; }`
- Other Sources/Ideas:
    - [cat color](https://stackoverflow.com/questions/7851134/syntax-highlighting-colorizing-cat), 
    - [supercat](http://supercat.nosredna.net/)
    - [vimcat](http://www.vim.org/scripts/script.php?script_id=4325)
    - [ccat](https://github.com/owenthereal/ccat)
    - [grep with color](https://linuxcommando.blogspot.com/2007/10/grep-with-color-output.html)
    - [highlight (native to Linux)](https://linux.die.net/man/1/highlight)
    - [pygment (python based; a bit slow](https://pygments.org/docs/cmdline/)
    
    
## CONFIGURATION

- Convert Bash input to vim mode: add `set editing-mode vi` to the `~/.inputrc` file. [src](https://www.reddit.com/r/vim/comments/7wj81e/you_can_get_vim_bindings_in_zsh_and_bash/)
- or ad hoc: type `set -o vi` in the terminal
- Turn of dinging: put line `set bell-style none` in your `/etc/inputrc` or `~/.inputrc` file (`$ echo 'set bell-style none' >> ~/.inputrc`) [(src)](https://stackoverflow.com/questions/36724209/disable-beep-of-linux-bash-on-windows-10)

## NAVIGATION

### Move Cursor

|      | Char   | Word    | Line   |
| ---- | ------ | -----   | ------ |
|RIGHT | Ctrl-F | Alt-F\* | Ctrl-E |
|LEFT  | Ctrl-B | Alt-B\* | Ctrl-A |
|UP    |        |         | Ctrl-P |
|DOWN  |        |         | Ctrl-N |

\* *Alt-<key> can be done instead by doing Esc then <key>*


- Move one char forward: `Ctrl-F` or `Right`
- Move one char backward: `Ctrl-B` or `Left`
- Move one word forward: `Alt-F`,  `Ctrl-Right`, or `Esc + F`
- Move one word backward: `Alt-B`, `Ctrl-Left`, or `Esc + B`
- Move one line up: `Ctrl-P`
- Move one line down: `Ctrl-N`
- Move home: `Ctrl-A`
- Move end: `Ctrl-E`

### Delete text

- Delete char: `Ctrl-D` or `Del`
- Delete previous word: `Ctrl-W`
- Delete next word: `Alt-D`
- Delete to end of line: `Ctrl-K`
- Delete to start of line: `Ctrl-U` or `Ctrl-X + Backspace`

### Transform text

- Swap char with previous: `Ctrl-T`
- Transposes the two words immediately before (or under) the cursor: `Esc + T`
- Transforms the text from the cursor to the end of the word to uppercase: `Esc + U`
- Transforms the text from the cursor to the end of the word to lowercase: `Esc + L`
- Changes the letter under the cursor (or the first letter of the next word) to upper: `Esc + C`

### Processes

- Keep using shell after opening other window: append `&` to the command [src](https://superuser.com/questions/513496/how-can-i-run-a-command-from-the-terminal-without-blocking-it)
- Ctrl+Z – suspend the current foreground process. This sends the SIGTSTP signal to the process. You can get the process back to the foreground later using the fg process_name (or %bgprocess_number like %1, %2 and so on) command.
- Ctrl+C – interrupt the current foreground process, by sending the SIGINT signal to it. The default behavior is to terminate a process gracefully, but the process can either honor or ignore it.
- Ctrl+D – exit the bash shell (same as running the exit command).

### Screen

- Ctrl+L – clears the screen (same effect as the “clear” command).
- Ctrl+S – pause all command output to the screen. If you have executed a command that produces verbose, long output, use this to pause the output scrolling down the screen.
- Ctrl+Q – resume output to the screen after pausing it with Ctrl+S. [src](https://www.tecmint.com/linux-command-line-bash-shortcut-keys/)

### Search previous commands

- Up arrow key – retrieves the previous command. If you press it constantly, it takes you through multiple commands in history, so you can find the one you want. Use the Down arrow to move in the reverse direction through the history.
- Ctrl+P and Ctrl+N – alternatives for the Up and Down arrow keys, respectively.
- Ctrl+R – starts a reverse search, through the bash history, simply type characters that should be unique to the command you want to find in the history.
- Ctrl+S – launches a forward search, through the bash history.
- Ctrl+G – quits reverse or forward search, through the bash history.

## SCRIPTING

    
### Function syntax:

All are valid (first is most common) [src](https://linuxize.com/post/bash-functions/):

```bash
function_name () {
  commands
}

function_name () { commands; }

function function_name {
  commands
}

function function_name { commands; }
```
    
### If-else

```bash
#!/bin/bash
T1="foo"
T2="bar"
if [ "$T1" = "$T2" ]; then
echo expression evaluated as true
else
echo expression evaluated as false
fi
```

### Comparing numbers:

- In bash, you should do your check in [arithmetic context](http://mywiki.wooledge.org/ArithmeticExpression): `if (( a > b )); then ... fi`
- For POSIX shells that don't support (()), you can use -lt and -gt: `if [ "$a" -gt "$b" ]; then ... fi` [src](https://stackoverflow.com/questions/18668556/comparing-numbers-in-bash)

### She-bang for script

- Put this at the beginning of the script: `#!/bin/bash`
- Example:
```bash
#!/bin/bash

# global variables
var1='A'
var2='B'

my_function () {
  local var1='C'
  var2='D'
  echo "Inside function: var1: $var1, var2: $var2"
}
```

### Arguments

- referenced in order as `$1`, `$2`, etc.
- `$0` = function name
- `$#` = number of passed arguments
- `$*` and `$@` both hold all arguments but behave different when double quoted:
- When double-quoted, `"$*"` expands to a single string separated by space --> `"$1 $2 $n"`.
- When double-quoted, `"$@"` expands to separate strings --> `"$1" "$2" "$n"`
- Slicing arguments:
```bash
echo $@;              #"p1" "p2" "p3" "p4" "p5"
echo ${@: 0};  #"bash" "p1" "p2" "p3" "p4" "p5"
echo ${@: 1};         #"p1" "p2" "p3" "p4" "p5"
echo ${@: 2};              #"p2" "p3" "p4" "p5"
echo ${@: 2:1};            #"p2"
echo ${@: 2:2};            #"p2" "p3"
echo ${@: -2};                       #"p4" "p5"
echo ${@: -2:1};                     #"p4"
```

### Case Statements

Example:
```bash
#!/bin/bash

echo -n "Enter the name of a country: "
read COUNTRY

echo -n "The official language of $COUNTRY is "

case $COUNTRY in

  Lithuania)
    echo -n "Lithuanian"
    ;;

  Romania | Moldova)
    echo -n "Romanian"
    ;;

  Italy | "San Marino" | Switzerland | "Vatican City")
    echo -n "Italian"
    ;;

  *)
    echo -n "unknown"
    ;;
esac
```

### Loops

Example:
```bash
#!/bin/bash
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done
```
or: `for i in 1 2 3 4 5; do echo $i ; done`


## WINDOWS-LINUX COMPATIBILITY

### WSL

- Mounting Drives  
```bash
sudo mkdir /mnt/x
sudo mount -t drvfs '\\network\path' /mnt/x
```
- Un-mount drive: `sudo umount /mnt/x` [src](https://superuser.com/questions/1128634/how-to-access-mounted-network-drive-on-windows-linux-subsystem/1261563)
    
- Mount a Drive Until Logoff:
    - Create a new folder for that drive letter under /mnt if it does not already exist. (ex: mkdir /mnt/m)
    - Mount the drive with `sudo mount -t drvfs M: /mnt/m`
- Mount Drives in a Persistent Manner ([src](https://www.public-health.uiowa.edu/it/support/kb48568/))
    - Ensure the folder exists for the mount target (e.g. `/mnt/m`)
    - Open /etc/fstab and add a line such as the following:
    - M: /mnt/m drvfs defaults 0 0
    - Reload the fstab file with sudo mount -a

- Using `start` in WSL: `alias start='cmd.exe /C start'`
- Check WSL version (in powershell): `wsl -l -v` [(src)](https://askubuntu.com/questions/1177729/wsl-am-i-running-version-1-or-version-2#:~:text=From%20the%20WSL%20shell%20prompt,4.19%2C%20it's%20WSL%20Version%202.)
- Change WSL version: `wsl --set-version Ubuntu 2` [(src)](https://aka.ms/wsl2kernel)

        
### Git Bash for Windows

- Find `etc` directory for Windows Git Bash: `c/Users/<username>/AppData/Local/Programs/Git/etc/`

### Commands to interface between Ubuntu and Windows

- Pipe output to clipboard from WSL: `<command> | clip.exe`


### AutoHotKey - Map CapsLock to Esc:

- install AutoHotKey
- create an `.ahk` script
- add `CapsLock::Esc` to the script
- run the script to enable it
- to run it at startup, add it to `C:\Users\<UserName>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
- you can open that folder by doing `win + r` and running `shell:startup`
[source](https://www.devdungeon.com/content/rebind-caps-lock-key-escapecontrol)


### CapsLock to BOTH Esc and Ctrl:

- Hard to implement Linux `xcape` solutions on WSL because it requires `X`, which is a window thing that probably won't run on there (I think) [that's what this guy talks about anyway; I haven't verified that WSL doesn't actually work](https://gitlab.com/interception/linux/plugins/caps2esc)
- [Another way](https://askubuntu.com/questions/177824/remapping-caps-lock-to-control-and-escape-not-the-usual-way)
- [This guy](https://gitlab.com/interception/linux/plugins/caps2esc) made a tool for Linux using C (hasn't been maintained for a long time). 
- [This guy](https://github.com/oblitum/Interception/tree/master/samples/caps2esc) made "Interception" for Windows but it's old (5 yrs)

- Add AutoHotKey to capslock: https://gist.github.com/sedm0784/4443120, https://github.com/ililim/dual-key-remap

