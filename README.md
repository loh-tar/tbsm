_tbsm_ is an application or session launcher, written in pure bash with no
ncurses or dialog dependencies. He is inspired by _cdm_, _tdm_, in some way by
_krunner_ and related.

It was attempted to design the behavior of _tbsm_ to be as less pesky as
possible, and to start daily tasks with as less key strokes.

Furthermore is there the possibility to customize his look by themes.

### Last version is 0.4 released Oct, 2017

#### Release Notes

    682e371 - Only start X session from tty
              This patch is pretty untested and breaks hopefully no use case
    cfc4134 - New command exit/X to logout from tty
    0422ab7 - Fix broken .desktop checking / parameter building
              Some session didn't start because of this and the too much parameter
    d7ddd83 - Don't start a session when not running in tty
              Treat all in /usr/share/xsessions as such and with Type=XSession
    e9b76ec - Don't 'exec' terminal programs, just start them
              Bad idea?
    daf86d9 - Add display name to XserverArg
              Done by simply use the tty number as X display name
    c16c915 - Review verbosity
              You may notice some more chattering but verboseLevel=2/info should be
              ok for daily work, neverless level 3/verbose is default now to become
              familar

The full changelog can you find
[here](https://github.com/loh-tar/tbsm/commits/master).

### Screenshots

These shots are here to give you an idea what you will get.

#### tbsm with tulizu

That's how my login screen looks after a while with an issue file of
[tulizu](https://loh-tar.github.io/tulizu/) and the default _tbsm_ theme.

![Login-with-tulizu](login-standard-theme-and-tulizu.png)

#### gently theme after a while giving a hint

![gently](gently-hint.png)

#### austere theme after _return_ with quick menue

![austere](austere-quick.png)

#### riddler theme

![riddler](riddler.png)

### Install

#### Packages

Arch users find it in [AUR](https://aur.archlinux.org/packages/tbsm/)

#### From Source

_cd_ into the downloaded source tree and simply run:

    sudo make install

To remove, which you will of cause never do, run:

    sudo make uninstall

### Post Install Tasks

To auto start _tbsm_ after login edit your _~/.bash_profile_, or similar, and
append to the end something like:

    # Auto start tbsm after login on first two VTs
    [[ $XDG_VTNR -le 2 ]] && tbsm

NOTE: Ensure you start no other display manager

And it may wise to run:

    tbsm doc man
    tbsm help

### License

GNU General Public License (GPL), Version 2.0
