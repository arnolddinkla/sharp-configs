# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#
# Modified version provided by sharp-configs.
#
# Use .xsessionrc for graphical sessions.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# include sbin in PATH
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi
if [ -d "/usr/sbin" ] ; then
    PATH="/usr/sbin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set tty colours to match .Xresources scheme
if [ "$TERM" = "linux" ]; then
    printf "\e]P0000000" # color0
    printf "\e]P1705050" # color1
    printf "\e]P260b48a" # color2
    printf "\e]P3dfaf8f" # color3
    printf "\e]P4506070" # color4
    printf "\e]P5dc8cc3" # color5
    printf "\e]P68cd0d3" # color6
    printf "\e]P7dcdccc" # color7
    printf "\e]P8888888" # color8
    printf "\e]P9dca3a3" # color9
    printf "\e]PAc3bf9f" # color10
    printf "\e]PBf0dfaf" # color11
    printf "\e]PC94bff3" # color12
    printf "\e]PDec93d3" # color13
    printf "\e]PE93e0e3" # color14
    printf "\e]PFeeeeee" # color15
#   clear # removes artefacts but also removes /etc/{issue,motd}
fi

# set ksh configuration file
export ENV="${HOME}/.kshrc"

# start the desktop automatically from TTY1
if [ $(tty) = /dev/tty1 ]
then
   if grep -qs quiet /proc/cmdline
   then
      exec startx -- vt1 -nolisten tcp -nolisten local > /dev/null 2>&1
   else
      exec startx -- vt1 -nolisten tcp -nolisten local
   fi
fi
