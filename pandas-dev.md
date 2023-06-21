# Pandas Dev Setup


## Working with GitHub repo

```
# clone the fork
git clone https://github.com/tpaxman/pandas.git pandas-tpaxman
cd pandas-tpaxman

# connect to the original pandas repo as the upstream
git remote add upstream https://github.com/pandas-dev/pandas.git
git fetch upstream

# create branch for the PR
git checkout -b new-feature

# refresh fork
git checkout main
git pull upstream main --ff-only

# refresh fork branch
git checkout shiny-new-feature
git fetch upstream
git merge upstream/main
```

## Setting up development environment

```
cd pandas-tpaxman
mamba deactivate
mamba env update -f environment.yml
mamba activate pandas-dev
```


## Checking the docstring changes


```
# Checking a docstring change without rebuild
python scripts/validate_docstrings.py pandas.DataFrame.mean

# make full build
python make.py clean
python make.py html

# omit autosummary and API section
python make.py clean
python make.py --no-api

# compile the docs with only a single section, relative to the "source" folder.
# For example, compiling only this guide (doc/source/development/contributing.rst)
python make.py clean
python make.py --single development/contributing.rst

# compile the reference docs for a single function
python make.py clean
python make.py --single pandas.DataFrame.join

# compile whatsnew and API section (to resolve links in the whatsnew)
python make.py clean
python make.py --whatsnew

# view compiled docs
cd doc/build/html/index.html
```

## Building



