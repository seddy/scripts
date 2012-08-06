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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]> '
    ;;
*)
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[01;33m\]@\[\033[01;32m\]\w\[\033[01;33m\]:>\[\033[0m\] '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[0;36m\]\h\[\033[0;33m\]@\[\033[0;32m\]\w\[\033[0;33m\]:>\[\033[0m\] '
    ;;

esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

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
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# Determine whether working at work or remotely
if [ -f /home/esaunder/scripts_openbet/get_location ]; then
	export LOCATION=$(/home/esaunder/scripts_openbet/get_location)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Source alias files
if [ -f /home/esaunder/scripts_openbet/ob_aliases ]; then
	. /home/esaunder/scripts_openbet/ob_aliases
fi

CVSROOT=:pserver:esaunder@pserver:/cvsroot

CLASSPATH=/var/www/esaunder/willhill/monitor/build/classes:/var/www/esaunder/willhill/monitor/lib:/usr/lib/jdk-1.1:/opt/informix/jdbc/lib/ifxjdbc-g.jar:/jserv/JSDK2.0/lib/jsdk.jar:/orbis-java/lib1.1/orbis.jar:/orajava/orajava.zip:/jdbc/lib/classes111.zip:/java/classes/java40.jar

export CLASSPATH

OPENBET=/prj/openbet/bin:/prj/deployment/bin:/lib:/prj/orbis/lib/ix86
APPSERV=/prj/openbet/bin/appserv:/prj/openbet/appserv/FREEZES/CURRENT/bin/ix86

TCL=/opt/tcl8.4
TCLLIBPATH=/usr/lib/tcl8.4

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/bin:/usr/lib:/usr/include:/shared/prj/openbet/appserv/FREEZES/CURRENT/lib/ix86:/opt/ChartDirector/lib

PATH=/shared/home/esaunder/bin:/local/Scripts:/shared/prj/telebet/tcl84_unix/bin:/usr/bin:/local/bin:$PATH
export TCLLIBPATH="/local/tcl84/lib/itcl3.2 /local/tcl84/lib/itk3.2 /local/tcl84/lib/iwidgets /local/tcl84/lib/Tktable2.8 /local/tbcload1.3 /opt/tcl8.4/lib/tbcload1.4 /opt/ActiveTcl-8.4/lib/tcl8.4/tbcload1.6.1 /opt/tcl8.5/lib"

#INFORMIXSERVER=sadr_10
INFORMIXSERVER=atlas_1150
INFORMIXDIR=/opt/informix

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$APPSERV:$OPENBET:$TCL:$TCL/lib
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INFORMIXDIR/lib:$INFORMIXDIR/lib/esql:/shared/prj/telebet/tcl84_unix/lib

# deployment
DEPLOYMENT=/prj/deployment/latest

PATH=$PATH:.:/local/j2re1.4.2_05/bin:/bin:/usr/local/bin:/sbin:/usr:/usr/sbin:~/bin:/usr/X11R6/bin:$INFORMIXDIR/bin:$SYBASE/bin:$ORACLE_HOME/bin:$JAVA/bin:$CCM_HOME/bin:$OPENBET:$APPSERV:$DEPLOYMENT/bin:$TLS:/local/j2re1.4.2_05/bin:/local/j2re1.4.2_05:/local/Scripts:/shared/prj/telebet/tcl84_unix/bin:/home/esaunder/bin:/usr/bin:/local/bin

export INFORMIXDIR INFORMIXSERVER PATH LD_LIBRARY_PATH TCL DEPLOYMENT OPENBET APPSERV CVSROOT

EDITOR=vim

export EDITOR


setup_path () {
        DEPLOYMENT=/shared/prj/deployment/latest
        PATH=$HOME/bin:/usr/bin:/usr/sbin:/bin:/prj/openbet/bin
        PATH=/usr/lib/jvm/java-1.5.0-sun-1.5.0.06/bin:$PATH
        PATH=$PATH:$DEPLOYMENT/scripts:$DEPLOYMENT/bin:$DEPLOYMENT/tcl
        PATH=$PATH:/opt/tclpro1.5/linux-ix86/bin/
        PATH=$PATH:/usr/games
        PATH=$PATH:/usr/local/bin
		PATH=$PATH:/home/esaunder/scripts
		PATH=$PATH:/local/Scripts:/shared/prj/telebet/tcl84_unix/bin:/home/esaunder/bin:/usr/bin:/local/bin

        LD_LIBRARY_PATH=/opt/tcl8.4/lib:/opt/tcl8.3.3/lib:/prj/openbet/lib/${ARCH}:/usr/lib:/usr/local/lib:/opt/ids920/lib
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ids920/lib/esql:/shared/prj/telebet/tcl84_unix/lib:/opt/informix/lib
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/tclpro1.5/linux-ix86/lib/

        if [ -d /usr/local/gnu/bin ]; then
                PATH=/usr/local/gnu/bin:$PATH
        fi

        if [ -n $INFORMIXDIR ]; then
                PATH=$PATH:$INFORMIXDIR/bin
                PATH=$PATH:$INFORMIXDIR/lib
                LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INFORMIXDIR/lib
                LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INFORMIXDIR/lib/esql
        fi

        if [ -n $TCL ]; then
                PATH=$PATH:$TCL/bin
                LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TCL/lib
        fi

        export PATH LD_LIBRARY_PATH DEPLOYMENT
        EXINIT="set notimeout"
        export EXINIT
}

setup_path

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "/home/esaunder/.rvm/scripts/rvm" ]] && source "/home/esaunder/.rvm/scripts/rvm"  # This loads RVM into a shell session.

