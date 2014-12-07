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
$ curl https://raw.githubusercontent.com/Hallian/gordon/master/install.sh | bash
```


## Soft install

If you would like to develop `gordon`, you could do a `soft install`
which simply links the `gordon.sh` from this repository to `/usr/bin/gordon`.

```bash
$ git clone git@github.com:Hallian/gordon.git
$ cd gordon
$ bash install.sh --soft
```

# Usage

## Init Chef repository

You can use `gordon` to start a new chef repository, e.g.

```bash
$ gordon init # default path for repo is /var/chef
$ gordon init myrepo # path to your new repository. must not exist
```

## Download

To download something from Chef Superstore, run:

```bash
$ cd /var/chef
$ gordon download nginx
```

## Dependencies

To see what dependencies your repository has, run:

```bash
$ cd /var/chef
$ gordon deps
```

You can also auto-download dependencies by running `download` with
no parameters, e.g.

```bash
$ cd /var/chef
$ gordon download
```

# Authors

Nikolas Lahtinen ([nikolas.ninja](http://nikolas.ninja))

# License
MIT
