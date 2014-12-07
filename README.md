# gordon
> _"Hell's Provisioning"_

After finding the `knife` commands to be verbose to a degree of extreme
annoyance and `knife` not managing the simple task of unpacking it's own
groceries, I decided there was need for an actual Chef so I called Gordon Ramsay
over! No more annoying fumbling with the knife as you try to remember whether it
was `cookbook site download` or `site download cookbook` or whatever. No more
combing through `metadata.rb`s and `metadata.json`s for dependencies. Need to
create new repository? _"Where was that example repo again? I swear I had the
url somehere in my emails..."_ Don't worry, Gordon has got you covered!

<img src="https://i.imgflip.com/f0j7j.jpg" alt="">

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

# Found a bug?

Please report any bugs you might encounter and pull requests are welcome.

# Authors

Nikolas Lahtinen ([nikolas.ninja](http://nikolas.ninja))

# License
MIT
