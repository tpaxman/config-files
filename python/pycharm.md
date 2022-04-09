# PyCharm Settings - Configuration Preferences



## Appearance & Behaviour

- Appearance
    - Theme: `Darcula`



## Keymap

- Editor Actions
    - Focus Editor: `ALT + SHIFT + LEFT`
- Main Menu
    - Tools
        - Python or Debug Console: `ALT + SHIFT + RIGHT`
    - Window
        - Active Tool Menu
            - Hide Active Tool Window: `CTRL + SHIFT + \`
            - Hide All Tool Windows: `CTRL + SHIFT + DELETE`
            - Maximize Tool Window: `CTRL + SHIFT + '`
            - Resize
               - Stretch to Left: `CTRL + ALT + SHIFT + LEFT`
               - Stretch to Right: `CTRL + ALT + SHIFT + RIGHT`
               - Stretch to Top: `CTRL + ALT + SHIFT + UP`
               - Stretch to Bottom: `CTRL + ALT + SHIFT + DOWN`
- Plugins
    - Python Community Edition
        - Execute Selection in Python Console: `ALT + SHIFT + E`
- Tool Windows
    - Terminal: `ALT + SHIFT + DOWN`
- Other
    - Clear All: `CTRL + L`



## Plugins

- IdeaVim: `INSTALL`



## Build, Execution, Deployment

- Console
    - Use IPython if available: `<CHECK>`
    - Show console variables by default: `<UNCHECK>`
    - Python Console
        - Starting Script:
            ```
            import sys
            import pandas as pd
            print('Python %s on %s' % (sys.version, sys.platform))
            sys.path.extend([WORKING_DIR_AND_PYTHON_PATHS])
            pd.options.display.width = 150
            pd.options.display.max_rows = 25
            pd.options.display.min_rows = 25
            pd.options.display.max_columns = 20
            pd.options.display.max_colwidth = 75
            ```



## Terminal

- Shell Path: `"C:\Program Files\Git\bin\sh.exe" --login`
- Tab name: `git-bash`
