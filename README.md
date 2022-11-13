_tbsm_ is an application or session launcher, written in pure bash with no
ncurses or dialog dependencies. It is inspired by _cdm_, _tdm_, in some way by
_krunner_ and related.

It was attempted to design the behavior of _tbsm_ to be as less pesky as
possible, and to start daily tasks with as less key strokes.

Furthermore is there the possibility to customize his look by themes.

Supports _Xorg_ as well as _Wayland_ sessions.

### Last version is 0.7, Nov 2022

#### Release Notes

    c69bc18 - runSession: detect DBUS_SESSION_ADDRESS
              Thanks to Victor for this DBUS/Wayland fix
    4e8ad87 - Drop not needed option when using ln command
    d6e8982 - Make check if running in tty more fuzzy ...
              With these two we try to be more BSD compatible
    56ec23b - Use colon as path separator in sessionPfads string
              CAUTION! if you have used that in your config!
    9c3a661 - Manual: Add a hint how to add a shell session to the menu

Older release notes [are here](https://raw.githubusercontent.com/loh-tar/tbsm/master/doc/81_ReleaseLog.txt).

The full changelog [is there](https://github.com/loh-tar/tbsm/commits/master).

### Screenshots

These shots are here to give you an idea what you will get. Don't worry, even if
the pictures are a bit antique, they are still up to date, except for the version
number you can read there.

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

### Installation

#### Packages

##### ArchLinux

The official package by author can be found in [AUR](https://aur.archlinux.org/packages/tbsm/).

##### openSUSE

No official package, but [one or more](https://software.opensuse.org/package/tbsm?search_term=tbsm)
provided by dedicated users.

#### From Source

In most cases simply _cd_ into the downloaded source tree and run:

    make

Read what is offered and run the command of your choice with root-power.

However, should you be on a non GNU system, or using a somehow special
distribution which only has a BusyBox, please [see here.](https://github.com/loh-tar/tbsm/issues/9)

#### Post Install Tasks

Read the [manual](https://github.com/loh-tar/tbsm/blob/master/doc/01_Manual.txt),
section 3- and 4- how to autostart and configure tbsm, by running:

    tbsm doc man

### Independent Forks - Community Contributions

  - Since we have decided in the past to [stop our i18n project](https://github.com/loh-tar/tbsm/issues/11)
 had _oltulu_ created his own [turkish version](https://github.com/oltulu/tbsm) of _tbsm_. Cool!

### License

GNU General Public License (GPL), Version 2.0
