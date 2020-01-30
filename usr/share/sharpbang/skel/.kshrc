# Set prompt
case $0 in
   *mksh*) . "${HOME}/.mkshrc" ;;
   *loksh*) PS1='\h:\w\e[1;31m${?#0}\e[0m\$ ' ;;
   *) : ;;
esac

# Alias commands to full path to prevent hi-jacking
alias su='/bin/su'
alias passwd='/usr/bin/passwd'
alias sudo='/usr/bin/sudo'

# Keep EMACS-style line editing even if VISUAL=vim is set
set -o emacs

# Enable colour support for ls, dir & grep
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color'
   alias dir='dir --color'
   alias vdir='vdir --color'
   alias grep='grep --color'
   alias fgrep='fgrep --color'
   alias egrep='egrep --color'
fi

# Get out faster
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List all enabled services
alias sluf='systemctl list-unit-files --state=enabled'
