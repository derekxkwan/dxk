# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

/usr/bin/setxkbmap -option ctrl:nocaps

#disable extra buttons on mouse
/usr/bin/xinput set-button-map 17 1 2 3 4 5 6 7 0 0 0 0 0

# disable key repeat for everything EXCEPT backspace, enter AND arrow keys
# doesn't seem to be working, maybe xfce overrides?
#/usr/bin/xset r on
#/usr/bin/seq 8 255 | /usr/bin/xargs -n 1 /usr/bin/xset -r
#/usr/bin/xset r 22
#/usr/bin/xset r 36
#/usr/bin/xset r 111
#/usr/bin/xset r 113
#/usr/bin/xset r 114
#/usr/bin/xset r 116

