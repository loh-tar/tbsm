To install from source cd into the downloaded tree and simply run:
  sudo make install

However, should you be on a non GNU system, or using a somehow special
distribution which only has a BusyBox, please see there:
  https://github.com/loh-tar/tbsm/issues/9

After that it may wise to run:
  tbsm doc man    # Most notably chapter 3
  tbsm help

To remove, which you will of cause never do, run:
  sudo make uninstall
