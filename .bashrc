# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
#       color_prompt=yes
#     else
#       color_prompt=
#     fi
# fi

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# LS_COLORS
LS_COLORS='rs=0:di=38;05;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=38;02;0;255;0:*.sh=38;5;118:*.md=38;05;159:*.c=38;05;49:*.h=38;05;51:*.py=38;02;255;204;102:*.json=38;5;249:*.csv=38;5;49:*.sql=38;5;208:*.html=38;5;202:*.css=38;5;39:*.scss=38;02;204;102;153:*.js=38;05;220:*.pp=38;5;214';

## Custom python prompt export.
export PYTHONSTARTUP="$HOME/.py_prompt.py"

## sgit - super git, alias for running several git commands.
alias sgit='f(){ git add "$1"; git commit -m "$2"; git push; unset -f f; }; f'

# PS1 configurations.

# PS1='\W$'
# PS1='  \[  \e[38;5;246m  \]  \W  \[  \e[m  \] \[  \e[38;5;220m  \]  \$ |  \[  \e[m  \]'
# PS1='                        \W                                     \$'

# PS1='\[\e[38;5;246m\]\W\[\e[m\]\[\e[38;5;220m\]\$ | \[\e[m\]'
PS1=$'\\[\e[38;5;246m\\]\W\\[\e[m\\]\\[\e[38;5;220m\\]\$ \u2502 \\[\e[m\\]'

## hsh - Alias for gcc with the extra compilation flags specific for simple shell.
alias hsh='gcc -Werror -Wall -Wextra -pedantic -g *.c -o hsh'

## GCC - Alias for all flags used at holberton.
alias GCC='gcc -Werror -Wall -Wextra -pedantic -g'

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# alias for cat with colors.
alias Cat='ccat -G Comment="darkgray" -G Punctuation="darkyellow" -G Keyword="blue" -G Plaintext="turquoise" -G String="red" -G Decimal="darkred"'

# alias for valgrind with --leak-check=full --show-leak-kinds=all
alias vs='valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all'

# Alias for checking all .py with pep8
alias guardiola='pep8 *.py'

# Alias to export DISPLAY variable.
alias setDISPLAY="export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0"

# Alias for compiling all .c for SDL.
alias cSDL='gcc *.c `sdl2-config --cflags --libs`'

# Use GNU ls colors when tab-completing files
set colored-stats on

# ShellCheck
alias sc='shellcheck'

# Update Upgrade Purge Clean Autoremove.
alias aptUpdate='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get purge && sudo apt-get clean && sudo apt-get autoremove -y'

# Alias for mysql prompt.
alias mysql='mysql --prompt="(\u@\h) [\d]> "'

# Bind the ctrl + left and right arrow keys.
bind '"\e[1;5D" backward-word'
bind '"\e[1;5C" forward-word'

# Alias for live server.
alias live-server='sudo live-server --port=80 --host=0.0.0.0'

# Alias for running a shell on a Docker container.
# usage: dockerSh <id of the container>
alias dockerSh='f(){ docker exec -it "$1" /bin/bash; }; f'

# Alias for getting the ip of the container base on its name.
# usage: dockerIp <name of the container>
alias dockerIp='f(){ docker inspect -f "{{ .NetworkSettings.IPAddress }}" $1; }; f'

# export WEB1="34.75.21.202"
# export WEB2="35.185.122.161"
# export LBA1="35.227.12.65"

. "$HOME/.cargo/env"