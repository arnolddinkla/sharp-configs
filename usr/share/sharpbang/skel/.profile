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
    printf "\e]P0444444" # color0
    printf "\e]P1aa4444" # color1
    printf "\e]P244aa44" # color2
    printf "\e]P3aaaa44" # color3
    printf "\e]P44444aa" # color4
    printf "\e]P5aa44aa" # color5
    printf "\e]P644aaaa" # color6
    printf "\e]P7aaaaaa" # color7
    printf "\e]P8888888" # color8
    printf "\e]P9aa6666" # color9
    printf "\e]PA66aa66" # color10
    printf "\e]PBaaaa66" # color11
    printf "\e]PC6666aa" # color12
    printf "\e]PDaa66aa" # color13
    printf "\e]PE66aaaa" # color14
    printf "\e]PFeeeeee" # color15
#   clear # removes artefacts but also removes /etc/{issue,motd}
fi

# Qt5 configuration
export QT_STYLE_OVERRIDE=GTK+
export QT_QPA_PLATFORMTHEME=gtk2
export QT_PLATFORMTHEME=gtk2
export QT_PLATFORM_PLUGIN=gtk2

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
