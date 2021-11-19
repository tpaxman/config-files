Python input functions

```python

# Read excel file
pd.read_excel()

# Write to csv file
pd.to_csv(index=False)

pd.read_csv("aaa.csv").loc[lambda x: x.FirstName.isin(["Bo", "Mo", "Zo"]).assign(FirstInitial=lamdbda x: x.FirstName.str[0])   # assign column for first initial based on the first name of something (mainly just an example of a very long comment after a one-liner)
```

Another way to show them

- read excel file: `pd.read_excel()`
- write csv file: `df.to_csv(index=False)`
- assign column for first initial based on the first name of something (mainly just an example of a very long comment after a one-liner): `pd.read_csv("aaa.csv").loc[lambda x: x.FirstName.isin(["Bo", "Mo", "Zo"]).assign(FirstInitial=lamdbda x: x.FirstName.str[0])`
