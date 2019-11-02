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
    printf "\e]P19e1828" # color1
    printf "\e]P2aece92" # color2
    printf "\e]P3968a38" # color3
    printf "\e]P4414171" # color4
    printf "\e]P5963c59" # color5
    printf "\e]P6418179" # color6
    printf "\e]P7bebebe" # color7
    printf "\e]P8888888" # color8
    printf "\e]P9cf6171" # color9
    printf "\e]PAc5f779" # color10
    printf "\e]PBfff796" # color11
    printf "\e]PC4186be" # color12
    printf "\e]PDcf9ebe" # color13
    printf "\e]PE71bebe" # color14
    printf "\e]PFffffff" # color15
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
