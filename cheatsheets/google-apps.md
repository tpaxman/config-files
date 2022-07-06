# Chrome

- generate QR code: `https://chart.googleapis.com/chart?chs=150x150&cht=qr&choe=UTF-8&chl=<url>`
- Open Bookmark manager: `Ctrl + Shift + O`

- Move tab to new window (Vimium): `Shift + W`

- Ctrl-n -- Open a new window
- Ctrl-Shift-n -- Open a new window in Incognito mode
- Ctrl-t -- Open a new tab, and jump to it
- Ctrl-Shift-t -- Reopen previously closed tabs in the order they were closed
- Ctrl-Tab or Ctrl-PgDn -- Jump to the next open tab
- Ctrl-Shift-Tab or Ctrl-PgUp -- Jump to the previous open tab
- Ctrl-1 through Ctrl-8 -- Jump to a specific tab
- Ctrl-9 -- Jump to the rightmost tab
- Alt-Home -- Open your home page in the current tab
- Alt-Left arrow -- Open the previous page from your browsing history in the current tab
- Alt-Right arrow -- Open the next page from your browsing history in the current tab
- Ctrl-w or Ctrl-F4 -- Close the current tab
- Ctrl-Shift-w or Alt-F4 -- Close the current window
- Alt-Space then n -- Minimize the current window
- Alt-Space then x -- Maximize the current window
- Alt-f then x -- Quit Google Chrome


# Gmail

- Sources
    - https://support.google.com/mail/answer/7190?hl=en deliveredto: -
    - https://webapps.stackexchange.com/questions/25996/how-to-filter-by-a-catch-all-address-in-gmail
    - https://webapps.stackexchange.com/questions/5719/is-it-possible-to-create-a-gmail-filter-that-works-on-headers-other-than-from-t

- `from:<name>|<email-address>`

- `to:<name>|<email-address>`

- `cc:<name>|<email-address>`

- `bcc:<name>|<email-address>`

- `has:<option>`, option=`drive|document|presentation|youtube|yellow-star|purple-star|blue-info`

- `subject:<subject>`

- `is:<status>`, status=`starred|snoozed|unread|read`

- `in:<folder>`, folder=`inbox|trash|sent|anywhere`

- `label:<labelname>`

- `list:<list-email-address>`

- `after:<yyyy mm dd>`

- `before:<yyyy mm dd>`

- `older:<yyyy mm dd>`

- `newer:<yyyy mm dd>`

- `older_than:<number><period>`, period=`d|m|y`

- `newer_than:<number><period>`, period=d|m|y

- `deliveredto:<email-address>`

- `category:<categoryname>` categoryname=primary|social|promotions|updates|forums|reservations|purchases

- `size:<numbytes>` (same as larger?)

- `larger:<numbytes>`

- `smaller:<numbytes>`

- `from:<name>`

- `OR` `AND` `AROUND <n>`
- or: `OR`, `{ }` exact phrase: `" "` group terms: `( )`

# YouTube

- Full screen: `f`
- Closed captions: `c`
- Miniplayer: `i`
- Play/Pause: `Spacebar`, `k`
- Move between H1 headers.: `1` or `Shift-1`
- Increase speed: `>`
- Decrease speed: `<`
- Next frame: `,` (while paused)
- Previous frame: `.` (while paused)
- Mute/unmute volume: `m`
- Increase/Decrease volume 5%: `Up`, `Down`
- Go Forward 10 seconds: `l`
- Go Backward 10 seconds: `j`
- Go Forward 5 seconds: `Right`
- Go Backward 5 seconds: `Left`
- Go to 10%: `1`
- Go to 90%: `9`
- Go to beginning: `0`, `Home`
- Go to end: `End`
- Next video: `Shift+N`
- Previous video: `Shift+P`
- Search box: `/`

# GOOGLE DRIVE
| Action | Key Combination |
| --- | --- |
| Select first item in list | g l |
| Select sidebar | g n |
| Go up one level | g p |
| Rename | n |
| Star | s |
| Delete | Shift + 3 |
| Open | o |
| Move | z |
| Create something | c |
| Create folder | Shift + f |
| Create doc | Shift + t |
| Create spreadsheet Shift + s |


# Google Apps Script

## READ THIS: [A Beginner's Guide to JavaScript's Prototype](https://tylermcginnis.com/beginners-guide-to-javascript-prototype/)

## Array Map Method

    dicevals.map(function (x) {return (x == '') ? x : randomroll()})
    dicevals.map((x) => (x == '') ? x : randomroll())

## Optimization

### Google source: https://developers.google.com/apps-script/guides/sheets/functions#optimization

### Basic tips: [Coding Tips For Beginners With Google Apps Script](https://www.benlcollins.com/apps-script/coding-tips/)

### Slow google sheet: [Slow Google Sheets? Here are 27 techniques you can try right now](https://www.benlcollins.com/spreadsheets/slow-google-sheets/)

### [Optimize read/write in Google Apps Script](https://stackoverflow.com/questions/51344493/optimize-read-write-in-google-apps-script)

### Comparison study of map, for, while: https://tanaikech.github.io/2018/04/16/benchmark-loop-for-array-processing-using-google-apps-script/

## Javascript cheat sheet: https://htmlcheatsheet.com/js/

## [Working with named ranges](https://developers.google.com/apps-script/reference/spreadsheet/named-range)

    // The code below updates the name for the first named range.
    var namedRanges = SpreadsheetApp.getActiveSpreadsheet().getNamedRanges();
    if (namedRanges.length > 1) {
      namedRanges[0].setName("UpdatedNamedRange");
    }

    SpreadsheetApp.getActiveSpreadsheet().getRangeByName(name)

## [Append string to each item](https://stackoverflow.com/questions/13605213/iterate-over-range-append-string-to-each)

    function appendString() {
      const range = SpreadsheetApp.getActiveSheet().getActiveRange();
      const values = range.getValues();
      const modified = values.map(row => row.map(currentValue => currentValue + " string"));
      range.setValues(modified);
    }

## Google Sheets Classes:

### [List of all classes](https://developers.google.com/apps-script/reference/spreadsheet/selection)

### [SpreadsheetApp](https://developers.google.com/apps-script/reference/spreadsheet/spreadsheet-app)

### [Spreadsheet](https://developers.google.com/apps-script/reference/spreadsheet/spreadsheet)

### [Sheet](https://developers.google.com/apps-script/reference/spreadsheet/sheet)

### [Range](https://developers.google.com/apps-script/reference/spreadsheet/range)

### [Selection](https://developers.google.com/apps-script/reference/spreadsheet/selection)

### [NamedRange](https://developers.google.com/apps-script/reference/spreadsheet/named-range)

## Typical operations

    var ss= SpreadsheetApp.getActiveSpreadsheet() // get the spreadsheet doc

    var sheet = ss.getActiveSheet() // get sheet in the doc
    var sheet = SpreadsheetApp.getActiveSheet() // get sheet in the doc

    ss.getName() // get name of document
    ss.getRange(a1Notation)
    ss.getRangeByName(name)

## Range Methods

    Range:
    clear() // clears everything
    clearContent() // just erases values; leaves formatting
    getBackground() // gets first cell’s background; returns #fffff string color
    getBackgrounds() // gets list of background color springs
    getBackgroundObject() // returns Color object
    getCell(row, column)
    getColumn()
    getFontColor()
    getFontColorObject()
    getValue() // gets the first value in the range
    getValues() // gets list of values
    insertCheckboxes()
    insertCheckboxes(checkedValue, uncheckedValue)
    isBlank()

    offset(rowOffset, columnOffset)
    setBackground(color)
    setBackgrounds(color)
    setFontColor(color)
    setValues(values)
    setValue(value)


    isChecked()
    uncheck()

## On Edit Function - for Spreadsheet

use form onEdit(e) e.range → returns Range object e.source → returns
Spreadsheet object e.oldValue → returns old value e.value → returns the
new value

## CopyPasteType

    PASTE_NORMAL - Paste values, formulas, formats and merges
    PASTE_NO_BORDERS - Paste values, formulas, formats and merges but without borders
    PASTE_FORMAT - Paste the format and data validation only
    PASTE_FORMULA - Paste the formulas only
    PASTE_DATA_VALIDATION - Paste the data validation only
    PASTE_VALUES - Paste the values ONLY without formats, formulas or merges
    PASTE_CONDITIONAL_FORMATTING - Paste the color rules only
    PASTE_COLUMN_WIDTHS - Paste the column widths only


## [onEdit](https://developers.google.com/apps-script/guides/triggers/events)

    function onEdit(e) {
      // Set a comment on the edited cell to indicate when it was changed.
      var range = e.range;
      range.
      range.setNote('Last modified: ' + new Date());
    }

