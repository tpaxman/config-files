Series: vectorized functions speed
```python
import numpy as np
import pandas as pd

def bad_for_vectors(a):
 return a + 1 if a < 100 else a - 1

def good_for_vectors(a):
 return np.where(a < 100, a + 1, a - 1)

s = pd.Series(np.linspace(0, 200, int(1e5)))

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
DataFrames
```python
import numpy as np
import pandas as pd

def bad_for_vectors(a, b):
 return a + 1 if a < b else b + 1

def good_for_vectors(a, b):
 return np.where(a < b, a + 1, b + 1)

df = pd.DataFrame({'a': np.linspace(0, 200, int(1e5)), 'b': np.linspace(0, 500, int(1e5))})

%timeit df.assign(val=lambda x: x.apply(lambda r: bad_for_vectors(r.a, r.b), axis=1))
%timeit df.assign(val=lambda x: np.vectorize(bad_for_vectors)(x.a, x.b))
%timeit df.assign(val=lambda x: good_for_vectors(x.a, x.b))

# 2.49 s ± 48.6 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
# 23.4 ms ± 339 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
# 2.03 ms ± 39.7 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
```

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
