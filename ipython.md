# iPython

History

```python
%history -g              # all history
%history -f filename.py  # print/save to file
%history -l <n>          # print the last n lines of history (including previous sessions)
%history -n              # show line numbers
ipython script.ipy       # run ipython script
```

Assign magic function output to variable

```python
x = %timeit -o f(a,b,c)
```
[stackoverflow](https://stackoverflow.com/questions/25289437/capture-the-result-of-an-ipython-magic-function)

Run a script
```python
```

```python
%run -i somefile.py # runs the file so that variables are injected into current workspace
```
