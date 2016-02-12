My dotfiles
===========

This is a simple collection of shell scripts to setup my dotfiles. Why Shell?
Because it gets shit done and I don't need any other fancy features.

Installation
------------

Clone the repository somehwere on your disk:

```
git clone https://github.com/KaiBirkenstock/dotfiles.git ~/.dotfiles
```

and launch the bootstrap script like this

```
GIT_AUTHORNAME="Kermit the frog" GIT_AUTHOREMAIL="kermit@sesame-street.org" GIT_GITHUBUSER="kermit" script/bootstrap.sh
```

The environment variables take care of your git configuration which is split
into `~/.gitconfig` and `~/.gitconfig.local`, where the latter is the file that
contains your personal settings (like your email address).

Some submodules might containt a `Makefile`. You are supposed to care of those
yourself.

Credits
-------

* [Nicolas Viennot](https://github.com/nviennot) for his awesome pry configuration
* [Zach Holman](https://github.com/holman) for his
  [dotfiles](https://github.com/holman/dotfiles) which served me as some kind of
  template
* [Sorin Ionescu](https://github.com/sorin-ionescu) for
  [prezto](https://github.com/sorin-ionescu/prezto)
