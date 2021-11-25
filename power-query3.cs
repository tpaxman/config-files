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

extract_parameter_from_named_range = (rangename) => Excel.CurrentWorkbook(){[Name=rangename]}[Content]{0}[Column1]

// map(each _ + 1, {1, 2, 3})
map = (f as function, x as list) => List.Transform(x, f)

// filter(each _ > 2, {1, 2, 3})
filter = (f as function, x as list) => List.Select(x, f)

// reduce((state, current) => state + current, {1, 2, 3, 4, 5}, 0)
reduce = (f as function, x as list, x0 as any) => List.Accumulate(x, x0, f)




