# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set prompt
PS1='\[\033[0;36m\]\h\[\033[0;33m\]@\[\033[0;32m\]\w\[\033[0;33m\]:>\[\033[0m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
	;;
*)
	;;
esac

# Alias definitions.
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
	eval "`dircolors -b`"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

# Determine whether working at work or remotely, LOCATION used
# in the rest of the alias scripts
if [ -f /home/esaunder/scripts_openbet/get_location ]; then
	export LOCATION=$(/home/esaunder/scripts_openbet/get_location)
fi

# Source alias files
if [ -f /home/esaunder/scripts_openbet/ob_aliases ]; then
	source /home/esaunder/scripts_openbet/ob_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Necessary
export EDITOR=vim
export EXINIT="set notimeout"

# Basic path
PATH=""

path_items=(
	$HOME/bin
	/usr/bin
	/usr/sbin
	/bin
	/usr/games
	/usr/local/bin
	$HOME/scripts
	$HOME/.rvm/bin
)

for i in ${path_items[@]}
do
	PATH=$PATH:$i
done

export PATH

# OB specific setup
if [ -f $HOME/.openbet_env.bashrc ]; then
	source $HOME/.openbet_env.bashrc
fi

# noths specific setup
if [ -f $HOME/scripts_noths/noths.bashrc ]; then
	source $HOME/scripts_noths/noths.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

