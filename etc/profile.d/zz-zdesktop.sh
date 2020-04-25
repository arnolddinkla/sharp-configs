if [ ! "$(id -u)" = 0 ] && [ -z "${DISPLAY}" ] && [ ! -f "${HOME}/.config/sharpbang/sharp-setup" ] ; then
   exec startx -- -nolisten tcp -nolisten local > /dev/null 2>&1
else
   :
fi
