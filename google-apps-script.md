# Google Apps Script

# Basic syntax
```{javascript}

// return value from function
var addNumbers = function(start, end) {
    return start + end
}

// printing to log
function print_log() {
  Logger.log("aaa")
}




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

