# Conda

## Environments

### General commands

    conda create --name py35 python=3.7
    conda activate py35
    conda deactivate
    conda list
    conda env remove --name bio-env

### List all environments

    conda info --envs
    conda info -e

### List revisions

    conda list --revisions
    conda install --revision 2

### Requirements files

One way is to create a text file

    conda list --explicit > bio-env.txt
    conda env create --file bio-env.txt 

Or a YAML file:

    conda env export > environment.yml

## Channels

### Conda Forge

    conda config --add channels conda-forge 
    conda config --set channel_priority strict 
    conda install <package-name>

[source](https://conda-forge.org/#about)

### Channel priority

> As of version 4.6.0, Conda has a strict channel priority feature. Strict channel priority can dramatically speed up conda operations and also reduce package incompatibility problems. We recommend it as a default. However, it may break old environment files, so we plan to delay making it conda's out-of-the-box default until the next major version bump, conda 5.0: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-channels.html

#### How to set

    conda config --describe channel_priority
    conda config --set channel_priority strict

[source](https://conda-forge.org/docs/user/tipsandtricks.html)

## Setting up on Git Bash

-   https://www.earthdatascience.org/workshops/setup-earth-analytics-python/setup-git-bash-conda/
-   https://stackoverflow.com/questions/54501167/anaconda-and-git-bash-in-windows-conda-command-not-found
-   I ran these two commands and it worked:

    . /c/Users/<username>/AppData/Local/Continuum/anaconda3/etc/profile.d/conda.sh
    conda init bash

## Cheat sheets

https://docs.conda.io/projects/conda/en/4.6.0/\_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf
https://kapeli.com/cheat\_sheets/Conda.docset/Contents/Resources/Documents/index

