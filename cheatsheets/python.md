# PYTHON

## Query a database
```python
import pyodbc
connection_string = "DRIVER={SQL Server};SERVER=servername;DATABASE=databasename"
sql = "SELECT * FROM table"
with pyodbc.connect(connection_string) as c:
    return pd.read_sql(sql, c)
```

## Ordered categorical with inferred categories

```python
import pandas as pd
from pandas.api.types import CategoricalDtype

# You can't get ordered categorical by doing this (default is unordered):
series.astype('category')

# This will work:
series.astype(pd.CategoricalDType(categories=series.unique(), ordered=True))

# So will this:
pd.Series(pd.Categorical(series, categories=series.unique(), ordered=True))
```

## Clean column names
```python
import re
def clean_colname(colname: str) -> str:
    return re.sub('\w+', '_', colname).strip('_').lower()
```


## Convert Excel serial dates to datetime
```python
from datetime import datetime, timedelta
def from_excel_ordinal(ordinal, _epoch0=datetime(1899, 12, 31)):
    if ordinal >= 60:
        ordinal -= 1 # Excel leap year bug, 1900 is not a leap year
    return (_epoch0 + timedelta(days=ordinal)).replace(microsecond=0)
```


## Argparse argument with either 0 or 1
```python
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('-a', nargs='?', const='x', default='y')
args = parser.parse_args()
print(args.a)
```

```bash
$ python script.py -a    # returns 'x' (const)
$ python script.py -a h  # returns 'h' (the provided value)
$ python script.py       # returns 'y' (default)
```

## Pad format strings
```python
message = 'something'
fill = ' '
align = '<'
width = 10
f'{message:{fill}{align}{width}}'
```

## Get sheet names from Excel file
```python
pip install openpyxl pandas
import pathlib
import pandas as pd
def get_sheet_names(filepath: str) -> list:
    with pd.ExcelFile(filepath) as f:
        return f.sheet_names
```

## Seaborn info

- color pallette examples: [(src)](https://medium.com/@morganjonesartist/color-guide-to-seaborn-palettes-da849406d44f)
- add log-scale: `sns.relplot(...).set(yscale="log")` [(src)](https://www.datacamp.com/community/tutorials/seaborn-python-tutorial#log)
- manual color specification: `sns.relplot(..., palette=['r', 'w', 'b']` [(src)](https://medium.com/@neuralnets/data-visualization-with-python-and-seaborn-part-3-69647c19bf2)


## Pathlib

- Move file: `sourcefilepath.replace(destfilepath)`

## Non-equi joins

https://stackoverflow.com/questions/46179362/fastest-way-to-merge-pandas-dataframe-on-ranges

## Melt multiple groups:

```python
data = pd.DataFrame({"ID": [1,2,3], "A1": [3,6,3], "A2": [4,9,2], "B1": [3,4,5], "B2": [1,1,1]})
d = {"A": {"A1": 1, "A2": 2}, "B": {"B1": 1, "B2": 2}}
def multi_melt(data, d):
    return pd.concat([data.melt(id_vars="ID", value_vars=v.keys(), var_name="N", value_name=k).replace({"N": v}).set_index(["ID", "N"]) for k, v in d.items()], axis=1)
multi_melt(data, d)
```

## Merge, Join, Concat

- `merge` - inner join by default: `pd.merge(df1, df2, left_index=True, right_index=True)`
- `join` - left join by default: `df1.join(df2)`
- `concat` - outer join by default: `pd.concat([df1, df2], axis=1)`
    
## Transform - Make column showing number of unique for the group

```python
# instead of this (joining a grouped copy of the table to itself):
data.set_index('index').join(data.groupby('index').agg(lambda x: len(set(x))), rsuffix='_distinctgroupcount')

# do the transform:
data['foo_distinctgroupcount'] = data.groupby('index').transform(lambda x: len(set(x)))

# however for multiple columns, the self-join may be better
# for example:
df = pd.DataFrame(dict(a=[1,1,1,2,2,2], b=[1,2,3,4,5,6], c=[4,5,6,4,5,6])).set_index('a')

# in this case both would work:
df.join(df.groupby('a').agg(b_total=('b', sum)))
df.assign(b_total = lambda df: df.groupby('a')['b'].transform(sum))

# but for multiple columns transform (maybe) requires multiple groupbys; not ideal:
df.join(df.groupby('a').agg(b_total=('b', sum), c_total=('c', sum)))
df.assign(b_total = df.groupby('a')['b'].transform(sum), c_total = df.groupby('a')['c'].transform(sum))
```


## Expand grid / Mesh Grid / Perms table

```python
import itertools
import pandas as pd
perms_dict = {'sport': ['basketball', 'soccer'], 'year': [2018, 2019, 2020]}
df = pd.DataFrame(itertools.product(*perms_dict.values()), columns=perms_dict.keys())
```

## Read Excel from a URL:

```python

df = pd.read_excel(url, engine='openpyxl')

# Similar approach:
r = requests.get(url)
with io.BytesIO(r.content) as f:
    wb = openpyxl.load_workbook(f)
df = pd.DataFrame(wb['Page1-1'].values)
```

## Set display settings for Pandas objects

```python
pd.options.display.max_rows = 16
pd.options.display.max_columns = 500
```

## Reset display settings

```python
pd.reset_option('display.max_rows')
```

## Pivot vs. Stack

- Pivot Cookbook: https://pandas.pydata.org/pandas-docs/stable/user_guide/cookbook.html#cookbook-pivot
- Pivot DataFrame: https://stackoverflow.com/questions/47152691/how-to-pivot-a-dataframe
- Pivot vs Pivot Table: https://stackoverflow.com/questions/30960338/pandas-difference-between-pivot-and-pivot-table-why-is-only-pivot-table-workin
- Stack Unstack vs Pivot Tables: https://medium.com/analytics-vidhya/pandas-stack-unstack-pivot-table-crosstab-5cb9a16fe020
- Pivot Tables - JVDP: https://jakevdp.github.io/PythonDataScienceHandbook/03.09-pivot-tables.html
- Stack and Unstack: https://nikgrozev.com/2015/07/01/reshaping-in-pandas-pivot-pivot-table-stack-and-unstack-explained-with-pictures/
- Reshaping: https://pandas.pydata.org/pandas-docs/stable/user_guide/reshaping.html

these are different for some reason:

```python
g.pivot_table(index=['risktype', 'fail_mode'], columns=['well'])
g.set_index(['risktype', 'fail_mode']).pivot_table(columns='well')
```

## Vectorized operations on dataframe - speed comparison

```python
import pandas as pd
import numpy as np
from itertools import product as prod

perms = prod(range(0,100), range(0,20), range(0,50), range(0,5))
df = pd.DataFrame(perms, columns=('a', 'b', 'c', 'd'))

def f(b, c, d):
    return b + c + d

# iterrows
[f(r.b, r.c, r.d) for _, r in df.iterrows()]    # 110 s. (slowest)

# apply
df.apply(lambda r: f(r.b, r.c, r.d), axis=1)    # 20.8 s (5x faster than slowest)

# array values
[f(b,c,d) for b,c,d in df[['b', 'c', 'd']].values]     # 740 ms (150x faster)

# zip column values
[f(b,c,d) for b,c,d in zip(df.b.values, df.c.values, df.d.values)]  # 298 ms (370x faster)

# zip columns
[f(b,c,d) for b,c,d in zip(df.b, df.c, df.d)]    # 213 ms (515x faster)

# numpy vectorize
vf = np.vectorize(f)
vf(df.b, df.c, df.d)   # 136 ms (800x faster)

# vectorizable function
f(df.b, df.c, df.d)   # 3 ms (36700x faster)
```

## Split one column into multiple

[src](https://cmdlinetips.com/2018/11/how-to-split-a-text-column-in-pandas/)

```python
# example raw data
df = pd.DataFrame({'raw': ['Bob,31,M', 'Leslie,44,F', 'Gob,77,M']})

# get dataframe of the 'raw' column split into separate columns
split_cols = df['raw'].str.split(',', expand=True).rename(columns=dict(enumerate(["Name", "Age", "Sex"])))

# join the columns back to the original table
df_joined = df.join(split_cols)
```

## Where - Pandas/Numpy

```python
df = pd.DataFrame({'a': [10,20,30,40,50,60,70], 'b': [1,8,6,5,4,8,6]})

# both of these methods give the same result:
method1 = df.a.where(df.b < 5, 0).values`
method2 = np.where(df.b < 5, df.a, 0)`

# result --> array([10,  0,  0,  0, 50,  0,  0], dtype=int64)`
```
    
## Pandas groupby

- Iterating through groupby: `for index_tuple, df_group in df.groupby([....]):`
    
- Group each set of continuous numbers:
```python
(pd.Series([1,2,3,4, 100, 101, 102, 500, 501])
 .diff()
 .fillna(100)
 .gt(1)
 .replace(False, np.nan)
 .cumsum()
 .ffill()
 .astype(int))
 ```

## Pandas shift

```python
pd.Series([1,2,3,4]).shift()   # --> [nan, 1, 2, 3]
pd.Series([1,2,3,4]).shift(-1) # --> [2, 3, 4, nan]
```

## Pandas diff

```python
pd.Series([1,2,3,4]).diff() # --> [nan, 1, 1, 1]
```

## Delete columns containing only empty values
```python
df[df.columns[df.any()]]    # delete all columns that contain only empty values
```

## Altair

### Pre-made color schemes ([List of schemes](https://vega.github.io/vega/docs/schemes/))

```python
alt.Chart(iris).mark_point().encode(
    x='petalWidth',
    y='petalLength',
    color=alt.Color('species', scale=alt.Scale(scheme='dark2'))
)
```

### Custom color scheme with 'domain' and 'range' ([source](https://altair-viz.github.io/user_guide/customization.html?highlight=color%20schemes))

```python
d= ['setosa', 'versicolor', 'virginica']
r= ['red', 'green', 'blue']

alt.Chart(iris).mark_point().encode(
    x='petalWidth',
    y='petalLength',
    color=alt.Color('species', scale=alt.Scale(domain=d, range=r))
)
```

### Adjusting axes domains with clip=True ([source](https://altair-viz.github.io/user_guide/customization.html))

```python
alt.Chart(cars).mark_point(clip=True).encode(
    alt.X('Acceleration:Q',
        scale=alt.Scale(domain=(5, 20))
    ),
    y='Horsepower:Q'
)
```


### Plotting facets

```python
(alt
    .Chart(df)
    .mark_line()
    .encode(x=alt.X('size'),
            y=alt.Y('time_s', scale=alt.Scale(type='log')),
            facet=alt.Facet('test_case', columns=2))
    .interactive()
    .save('a.html')
)
```


## Map

```python
# this
map(str, s)

# is the same as:
(str(i) for i in s)
```

## Filter

```python
# this:
map(str,filter(g,s))

# is the same as this:
(str(i) for i in s if g(i))
```

## Code Style

What order to form functions?
```python
def calc_any_type(input_value, calc_type):
    assert is_valid_input(input_value)
    assert is_valid_type(calc_type)
    if calc_type == 'a':
        return calc_type_a(input_value)
    elif calc_type == 'b':
        return calc_type_b(input_value)
    elif calc_type == 'c':
        return calc_type_c(input_value)
    else:
        raise ValueError('input_value is not good')

def calc_type_a(input_value):
    assert is_valid_input(input_value)
    return input_value + 1

def calc_type_b(input_value):
    assert is_valid_input(input_value)
    return input_value + 2

def calc_type_c(input_value):
    assert is_valid_input(input_value)
    return input_value + 3


def calc_any_type(input_value, calc_type):
    assert is_valid_input(input_value)
    assert is_valid_type(calc_type)
    if calc_type == 'a':
        return input_value + 1
    elif calc_type == 'b':
        return input_value + 2
    elif calc_type == 'c':
        return input_value + 3
    else:
        raise ValueError('input_value is not good')

def calc_type_a(input_value):
    return calc_any_type(input_value, calc_type='a')

def calc_type_b(input_value):
    return calc_any_type(input_value, calc_type='b')

def calc_type_c(input_value):
    return calc_any_type(input_value, calc_type='c')
```

## Code Golf Tips

- "Not" operations: `not f` --> `1-f` (e.g., where `f=i<0`)
- Modulo check: `i%2==0` --> `i%2<1`
- While loops: `while x>-2` --> `while x+2`
- String fill: `(i*"*").center(t)` --> `f' {i*"*":^{t}}'`
- Pad string: `'0000000005'` --> `f"{5:0>10}"`
- map dict: `list(map({'A':1, 'B': 2, 'C': 4}.get,'ABC'))`
- create list: `list(map(f,arr))` --> `[*map(f,arr)]`
- double loops:

```python
# replace:
for i in range(m):
 for j in range(n):
  do_stuff(i,j)

# with:
for k in range(m*n):
  do_stuff(k//n,k%n)
```

## Linear Regression

```python
import numpy as np
from sklearn.linear_model import LinearRegression

x_raw = np.arange(0,10)
x = x_raw.reshape(-1,1)
y = 2*x_raw**1.05 + 10

model = LinearRegression().fit(x,y)
coef = model.coef_
intercept = model.intercept_
r_sq = model.score(x,y)
```

## Make Alternatext

```python
''.join(x.upper() if i % 2 else x.lower() for i, x in enumerate(some_text))
```

## Convert string to file IO object

```python
import io
import pandas as pd
with io.StringIO('<html><body><table> ... ') as f:
    df = pd.read_html(f)
```

## Check if object is iterable

```python
def is_iterable(x):
    """tests if item is an iterable"""
    try:
        iter(x)
    except TypeError:
        return False
    else:
        return True
```
[stackoverflow](https://stackoverflow.com/questions/1952464/in-python-how-do-i-determine-if-an-object-is-iterable)

## If you want the arg to be either `None` or something else:

```python
from typing import Optional
def foo(arg: Optional[int] = None) -> None:
    ...

# or:
def foo(arg: bool = None):
    ...
```

## Read a json file from a github raw url:

```python
import json, requests, io
url = f"https://raw.githubusercontent.com/SMenigat/thousand-most-common-words/master/words/de.json"
d = json.load(io.BytesIO(requests.get(url).content)) 
```

## Selenium - get attribute names and values

```python
from selenium import webdriver
WebElement = webdriver.remote.webelement.WebElement

def _get_element_attributes(elem: WebElement) -> dict:
    list_of_dicts_of_attributes_properties = elem.get_property('attributes')
    attributes_dict = {x['nodeName']: x['nodeValue'] for x in list_of_dicts_of_attributes_properties}
    return attributes_dict
```

## Get soup from url

```python
import requests
from bs4 import BeautifulSoup

def get_soup(url):
    response = requests.get(url)
    content = response.content
    soup = BeautifulSoup(content)
    return soup
```

## Download a large file in chunks

```python
import requests
url = ...
response = requests.get(url)

# write it in chunks (too big otherwise)
with open(output_file, 'wb') as f:
    for chunk in response.iter_content(chunk_size=8192):
        f.write(chunk)
```

## Download zipfiles

```python
import io, zipfile, pathlib, requests

def unzip_from_url(url, dst):
    # create the output directory
    pathlib.Path(dst).mkdir(exist_ok=True)
    # get the zipfile data from the url
    response = requests.get(url)
    # extract the zipfile contents to the output directory
    with io.BytesIO(response.content) as f:
        zipfile.ZipFile(f).extractall(path=dst)

unzip_from_url('https://www.ssa.gov/oact/babynames/names.zip', 'usa/names-country')
```

## Logging

Basic commands
```python
import logging
logging.basicConfig(level=logging.DEBUG)
logging.debug('This will get logged')
```
[source](https://realpython.com/python-logging/)


## Pretty-print json file

```python
 python -m json.tool tableExport.json
```

## Google API for Python

```python
pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib
curl https://raw.githubusercontent.com/googleworkspace/python-samples/master/sheets/quickstart/quickstart.py -o quickstart.py

https://console.cloud.google.com/
- APIs & Services
- Credentials
- Create Credentials
- OAuth Client ID 
- Download JSON
- Move JSON to current dir and rename credentials.json

Enable the Google Sheets API
https://console.developers.google.com/apis/api/sheets.googleapis.com/overview?project=1001390277221
```

## Flatten list
```python
def flatten_list(lst: list) -> list:
    return [item for sublist in lst for item in sublist]
```

## Sets
operation | method | operator
---| --- | --- 
Union|`union` | `\|`
Intersection|`intersection` | `&`
Difference|`difference` | `-`
Symmetric difference|`symmetric_difference` | `^`
Disjoint|`isdisjoint` | `<none>`
Subset|`issubset` | `<=`
Superset|`issuperset` | `>=`
Proper subset| none | `<` 
Proper superset| none | `>`



## Putting HTML info BeautifulSoup
```python
# get soup from url:
response = requests.get(url)
html_text = response.text
soup = BeautifulSoup(html_text, "html.parser")

# get soup from file:
with open(filename) as f:
    soup = BeautifulSoup(f, 'html.parser')

# get soup from string:
soup = BeautifulSoup('<b class="boldest">Extremely bold</b>', 'html.parser')

# Function definitions:
def soupify_url(url: str) -> BeautifulSoup:
    return BeautifulSoup(requests.get(url).text)


def soupify_file(filename):
    with open(filename, encoding='utf-8') as f:
        return BeautifulSoup(f.read())


def download_page_source_to_file(url: str, filename: str) -> None:
    response = requests.get(url)
    content = response.text
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)
```

## Parse BeautifulSoup tags
```python
# get tag:
b_tag = soup.b

# get name of tag:
b_tag.name  # 'b'

# get an attribute from tag:
b_tag['class']
b_tag.attrs['class']  # 'boldest'

# get tag's children:
tag.contents # (returns a list of direct children)
tag.children # (returns a generator of direct children)
tag.descendants # (returns generator or all children recursively)

# find by class:
tag.find(class_='name-of-class')
tag.find(attrs={'class': 'name-of-class'})
```

## Series: vectorized functions speed
```python
import numpy as np
import pandas as pd

def bad_for_vectors(a):
 return a + 1 if a < 100 else a - 1

def good_for_vectors(a):
 return np.where(a < 100, a + 1, a - 1)

s = pd.Series(np.linspace(0, 200, int(1e5)))
```

```
# %timeit s.apply(bad_for_vectors)
# %timeit [bad_for_vectors(x) for x in s]
# %timeit [bad_for_vectors(x) for x in s.values]
# %timeit np.vectorize(bad_for_vectors)(s)
# %timeit good_for_vectors(s)

# 23.9 ms ± 520 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
# 23.8 ms ± 173 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
# 63.2 ms ± 3.02 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)
# 20 ms ± 670 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
# 892 µs ± 4.61 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)
```

## DataFrames: vectorized functions speed
```python
import numpy as np
import pandas as pd

def bad_for_vectors(a, b):
 return a + 1 if a < b else b + 1

def good_for_vectors(a, b):
 return np.where(a < b, a + 1, b + 1)

df = pd.DataFrame({'a': np.linspace(0, 200, int(1e5)), 'b': np.linspace(0, 500, int(1e5))})
```

```
%timeit df.assign(val=lambda x: x.apply(lambda r: bad_for_vectors(r.a, r.b), axis=1))
%timeit df.assign(val=lambda x: np.vectorize(bad_for_vectors)(x.a, x.b))
%timeit df.assign(val=lambda x: good_for_vectors(x.a, x.b))

# 2.49 s ± 48.6 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
# 23.4 ms ± 339 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
# 2.03 ms ± 39.7 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
```

### Findings:

- apply is the slowest by far
- using np.vectorize first gives about 100x performance boost
- re-writing the function with numpy vectors gives ~1000x performance boost
DataFrames method chaining

```python
# This script is to compare the differences in speed when doing a few method
# chaining calculations in pandas dataframes.

import numpy as np
import pandas as pd

# DUMMY FUNCTIONS: These are two dummy test functions to be used on the dataframe:
def calc_c(a, b):
    """ this function is vector compatible"""
    return a * b


def calc_compare(a, b):
    """ this function is not vector compatible"""
    if a < b:
        val = a
    else:
        val = b
    return val


# TEST METHODS: ---------------------------------------------------------
def test_method_0(df):
    """METHOD 0: using the apply method"""
    df_out = (df
        .assign(c=lambda x: x.apply(lambda r: calc_c(r.a, r.b), axis=1))
        .assign(area=lambda x: x.apply(lambda r: calc_compare(r.a, r.b), axis=1))
        .loc[lambda x: x.c > 4000]
        )
    return df_out


def test_method_1(df):
    """METHOD 1: vectorize the functions"""
    # This is where the functions are vectorized using numpy vectorize
    calc_compare_vector = np.vectorize(calc_compare)
    calc_c_vector = np.vectorize(calc_c)

    df_out = (df
        .assign(c=lambda x: calc_c_vector(x.a, x.b))
        .assign(area=lambda x: calc_compare_vector(x.a, x.b))
        .loc[lambda x: x.c > 4000]
        )
    return df_out


def test_method_2(df):
    """METHOD 2: use pre-vectorized functions (rewritten using vectorized statements)"""
    calc_c_prevec = calc_c  # this function is already vectorized

    def calc_compare_prevec(a, b):
        # this function is re-written to do the same thing as calc_compare but for arrays
        return np.where(a < b, a, b)

    df_out = (df
        .assign(c=lambda x: calc_c_prevec(x.a, x.b))
        .assign(area=lambda x: calc_compare_prevec(x.a, x.b))
        .loc[lambda x: x.c > 4000]
        )
    return df_out


df = pd.DataFrame({'a': np.linspace(0, 200, int(1e5)),
                   'b': np.linspace(0, 500, int(1e5)),
                   })

# SPEED RESULTS:
# %timeit test_method_0(df) -- 7.99 s ± 72 ms per loop
# %timeit test_method_1(df) -- 81.8 ms ± 6.93 ms per loop
# %timeit test_method_2(df) -- 22.5 ms ± 704 µs per loop


# CONCLUSIONS:
# using pre-vectorized functions is the fastest way; however, it requires re-writing functions
# using np.vectorize is effective at speeding up the functions almost as well as the re-written pre-vectorized ones
# using DataFrame.apply is the slowest by far (100x slower than method 1 and 350x slower than method 2)
```


## iPython - History

```python
%history -g              # all history
%history -f filename.py  # print/save to file
%history -l <n>          # print the last n lines of history (including previous sessions)
%history -n              # show line numbers
ipython script.ipy       # run ipython script
```

## iPython - Assign magic function output to variable

```python
x = %timeit -o f(a,b,c)
```
[stackoverflow](https://stackoverflow.com/questions/25289437/capture-the-result-of-an-ipython-magic-function)

## iPython - Run a script

```python
%run -i somefile.py # runs the file so that variables are injected into current workspace
```
