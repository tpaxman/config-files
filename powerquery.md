# POWER QUERY


## Get value from named range cell
```
(rangename as text) as any => Excel.CurrentWorkbook(){[Name=rangename]}[Content]{0}[Column1]
```

## Read from Database
```
# basic: does not fold after
Sql.Database(server, database, [Query=sql])

# native query + enable folding: folds (if simple)
Value.NativeQuery(Sql.Database(server, database), sql, null, [EnableFolding=true])

# native query + enablefolding + params: does not fold when you include parameters
Value.NativeQuery(Sql.Database(server, database), sql, params, [EnableFolding=true])

# native query + enable 
Value.NativeQuery(Sql.Database(server, database), Text.Format(sql, params), null, [EnableFolding=true])
```



## Read plain text file

```csharp
read_textfile = (filename as text, optional encoding as number) as text =>
    let
        encoding_used = if encoding <> null then encoding else TextEncoding.Windows,
        Contents.ToLines = (contents as binary) as list => Line.FromBinary(contents, null, null, encoding_used)
    in
        compose({File.Contents, Contents.ToLines, Lines.ToText})(filename)
```


## Find Columns with Errors
```csharp
find_cols_with_errors = compose({
    Table.SelectRowsWithErrors,
    (x) => Table.UnpivotOtherColumns(x, {}, "colname", "value"),
    Table.SelectRowsWithErrors,
    (x) => Table.Column(x, "colname"),
    List.Distinct
})

```

## Pipe Functions
```csharp
pipe = (seed as any, funcs as list) as any =>
    List.Accumulate(funcs, seed, (x,f) => f(x))

compose = (funcs as list) as function =>
    (seed as any) => pipe(seed, funcs)
```

## Create Tables

```
#table({"a", "b"}, {{1, "x"}, {3, "y"}})
#table(type table [a=Number.Type, b=Number.Type]}, {{1, "x"}, {3, "y"}})
Table.FromRecords({[a=1, b="x"], [a=3, b="y"]})
Table.FromRows({{1, "x"}, {3, "y"}}, {"a", "b"})
Table.FromColumns({{1, 3}, {"x", "y"}}, {"a", "b"}})

// empty table
#table({"a", "b", {})
```

## Comparison with Python

PYTHON | POWER QUERY
--- | ---
`a = [1, 2, 3]`, `a = (1, 2, 3)` | `a = {1, 2, 3}`
`a[2]` | `a{2}`
`d = {"a": 1, "b": 2}` | `d = [a=1, b=2]`
`d = {"ha ha": 1, "ho ho": 2}` | `d = [#"ha ha"=1, #"ho ho"=2]`
`d = {1: 4, 2: 8}` | `d = [1=4, 2=8]`
`d["ha ha"]`, `d.get("ha ha")` | `d[ha ha]`, `Record.Field(d, "ha ha")`


## Reading Data

```csharp
read_excel = (filename, item, kind) => Excel.Workbook(File.Contents(filename), null, true){[Item=item,Kind=kind]}[Data],
read_excel_sheet = (filename, sheetname) => read_excel(filename, sheetname, "Sheet"),
read_excel_table = (filename, tablename) => read_excel(filename, tablename, "Table"),
read_csv = (filename, sep) => Csv.Document(File.Contents(filename),[Delimiter=sep, Encoding=65001]),
read_table = (tablename) => Excel.CurrentWorkbook(){[Name=tablename]}[Content]
```

## Get values from range:

```csharp
extract_parameter_from_named_range = (rangename) => Excel.CurrentWorkbook(){[Name=rangename]}[Content]{0}[Column1]
```

## Map, Filter, Reduce

```
// map(each _ + 1, {1, 2, 3})
map = (f as function, x as list) => List.Transform(x, f)

// filter(each _ > 2, {1, 2, 3})
filter = (f as function, x as list) => List.Select(x, f)

// reduce((state, current) => state + current, {1, 2, 3, 4, 5}, 0)
reduce = (f as function, x as list, x0 as any) => List.Accumulate(x, x0, f)
```

## Cartesian Product (cross product/combinations)
```csharp
cartesian_product = (a as list, b as list) => List.Generate(()=>[i=0,j=0], each [i]<List.Count(a), each if [j]<List.Count(b)-1 then [i=[i], j=[j]+1] else [i=[i+1], j=0], each {a{[i]}, b{[j]})
```

