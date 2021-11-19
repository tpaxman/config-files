# Power Query

PYTHON | POWER QUERY
--- | ---
`a = [1, 2, 3]`, `a = (1, 2, 3)` | `a = {1, 2, 3}`
`a[2]` | `a{2}`
`d = {"a": 1, "b": 2}` | `d = [a=1, b=2]`
`d = {"ha ha": 1, "ho ho": 2}` | `d = [#"ha ha"=1, #"ho ho"=2]`
`d = {1: 4, 2: 8}` | `d = [1=4, 2=8]`
`d["ha ha"]`, `d.get("ha ha") | `d[ha ha]`, `Record.Field(d, "ha ha")`

## Lists
```csharp
// create list:
a = {1, 2, 3, 4}
```
access list element: `a{0}` --> `1`
- 
