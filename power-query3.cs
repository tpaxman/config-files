// POWER QUERY

// READ DATA
// Excel.Workbook(workbook as binary, optional useHeaders as any, optional delayTypes as nullable logical) as table
// File.Contents(path as text, optional options as nullable record) as binary
// Csv.Document(source as any, optional columns as any, optional delimiter as any, optional extraValues as nullable number, optional encoding as nullable number) as table
read_excel = (filename, item, kind) => Excel.Workbook(File.Contents(filename), null, true){[Item=item,Kind=kind]}[Data],
read_excel_sheet = (filename, sheetname) => read_excel(filename, sheetname, "Sheet"),
read_excel_table = (filename, tablename) => read_excel(filename, tablename, "Table"),
read_csv = (filename, sep) => Csv.Document(File.Contents(filename),[Delimiter=sep, Encoding=65001]),
read_table = (tablename) => Excel.CurrentWorkbook(){[Name=tablename]}[Content]

