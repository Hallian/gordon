# gordon
> _"Hell's Provisioning"_

# Installing

## Prerequisites

You'll need `knife` and `CoffeeScript` to use this program, e.g.

```bash
    $ apt-get install -y npm chef
    $ npm install -g coffee-script
``` 

Follow these instructions to install `gordon`.

```bash
    $ git clone git@github.com:Hallian/gordon.git
    $ cd gordon
    $ sudo bash install.sh
```


## Soft install

If you would like to develop `gordon`, you could do a `soft install`
which simply links the `gordon.sh` from this repository to `/usr/bin/gordon`.

```bash
    $ git clone git@github.com:Hallian/gordon.git
    $ cd gordon
    $ sudo bash install.sh --soft
```

# Usage

## Init chef repository

You can use `gordon` to start a new chef repository, e.g.

```bash
    $ mkdir sweetapp
    $ cd sweetapp
    $ gordon init
```

## Download

To download something from Chef Superstore, run:

```bash
    $ gordon download nginx
```

## Dependencies

To see what dependencies your repository has, run:

```bash
    $ gordon deps
```

You can also auto-download dependencies by running `download` with
no parameters, e.g.

```bash
    $ gordon download
```

# Authors

Nikolas Lahtinen ([nikolas.ninja](http://nikolas.ninja))

# License
MIT
