# Sikevux’s dotfiles

## Installation

### Using Git and the bootstrap script

```bash
git clone https://github.com/sikevux/dotfiles.git && cd dotfiles && git submodule init && git submodule update && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

Alternatively, to backup original files if it's a new install:

```bash
set -- -b; source bootstrap.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any
feature testing (such as
[detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use
this to add a few custom commands without the need to fork this entire
repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my
# name
GIT_AUTHOR_NAME="Patrik Greco"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="sikevux@sikevux.se"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from
my dotfiles repository. It’s probably better to
[fork this repository](https://github.com/sikevux/dotfiles/fork) instead, though.

## Thanks to…

* [Mathias Bynens](http://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
* [Fredrik Strandin](http://kd35a.se) and his [dotfiles repository](https://github.com/kd35a/dotfiles)
