# Windows

- Turn off Scroll Lock: by seaching "On-screen Keyboard" and then pressing Scrl Lk
- Print Screen Variations: `Alt + PrintScreen`: capture current window only `Win + PrintScreen`:
save a png to Pictures/Screenshots folder

# Powershell

- Rename files with regex:

     dir | Rename-item -whatif -Newname {$_.name -replace '[regex string]', '[replace]'}
     dir | Rename-item -Newname {$_.name -replace '[regex string]', '[replace]'}

# Windows Explorer

- Sort by...: `Alt + VO`

- Expand columns: `Alt+ VSF`

- View properties: `Alt + Enter`

- Copy as path: `Alt + HCP`

- Create new folder: `Ctrl + Shift + N`

- Open in new window: `Ctrl + Enter` or `Ctrl + double-click`

# Remote Desktop

- Minimize: `Ctrl-Alt-Home` to shift focus to local machine;`Win-D` to minimize all or `Win-T` to select the taskbar [source](https://superuser.com/questions/207534/keyboard-shortcut-to-minimize-remote-desktop)

