# SQL

## Get column names in information schema
```sql
SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
```

## Dynamic query with variable column names
```sql
DECLARE @colname varchar(50) = 'Name'
DECLARE @sql varchar(max) = 'SELECT ' + @colname + ' FROM table'
EXEC(@sql)
```

## Declare variables
```
DECLARE @value AS VARCHAR(100) = 'thing';
SELECT * FROM table WHERE col = @value
```

## Unpivot
```
WITH selection AS (SELECT idx, a1, a2, a3 FROM table)
SELECT m.idx, m.letter, m.attribute, m.value
FROM selection
UNPIVOT (value FOR attribute IN (a1, a2, a3)) AS m
```

## WITH expressions
```sql
-- This
WITH b as (SELECT * FROM t)
SELECT x, y, z
FROM a INNER JOIN b
ON a.id = b.id

-- Is the same as this
SELECT x, y, z
FROM a
INNER JOIN (SELECT * FROM t) b
ON a.id = b.id
```


## INFORMATION SCHEMA VIEWS
```
INFORMATION_SCHEMA
    .COLUMNS
        TABLE_CATALOG
        TABLE_SCHEMA
        TABLE_NAME
        COLUMN_NAME
        ORDINAL_POSITION
        COLUMN_DEFAULT
        IS_NULLABLE
        DATA_TYPE
        CHARACTER_MAXIMUM_LENGTH
        CHARACTER_OCTET_LENGTH
        NUMERIC_PRECISION
        NUMERIC_PRECISION_RADIX
        NUMERIC_SCALE
        DATETIME_PRECISION
        CHARACTER_SET_CATALOG
        CHARACTER_SET_SCHEMA
        CHARACTER_SET_NAME
        COLLATION_CATALOG
        COLLATION_SCHEMA
        COLLATION_NAME
        DOMAIN_CATALOG
        DOMAIN_SCHEMA
        DOMAIN_NAME
    .TABLES
        TABLE_CATALOG
        TABLE_SCHEMA
        TABLE_NAME
        TABLE_TYPE

Example: SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
```
