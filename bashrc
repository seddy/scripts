# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export ARCH=$(uname -s)

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
  if [[ `which dircolors` != "" ]]; then
    eval "`dircolors -b`"
  fi

  if [ $ARCH != "Linux" ]; then
    alias vi='vim' # SOME CUNTS HAVE FORCED THEIR OWN VIMRC ON PIVOTAL BOXES
    alias ls='ls -G'
  else
    alias ls='ls --color=auto'
  fi

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
  ./bin
  $HOME/.rvm/bin
  $HOME/bin
  /usr/bin
  /usr/sbin
  /bin
  /usr/games
  $HOME/scripts
  /user/sbin
  /usr/local/bin
  $HOME/perl5/bin
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

# twistilled specific setup
if [ -f $HOME/scripts_twistilled/twistilled.bashrc ]; then
  source $HOME/scripts_twistilled/twistilled.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# set prompt - note this will be overwritten by scripts/set_prompt_status
# if installed!
PS1='\[\033[0;36m\]\h\[\033[0;33m\]@\[\033[0;32m\]\w\[\033[0;33m\]:>\[\033[0m\] '
if [[ $PROMPT_COMMAND != "" ]]
then
  PROMPT_COMMAND="$PROMPT_COMMAND && source ~/scripts/set_prompt_status"
else
  PROMPT_COMMAND="source ~/scripts/set_prompt_status"
fi

alias rs="bundle exec rspec -c --format=doc"
alias rc="bundle exec cucumber "
alias zs="zeus rspec -c --format=doc"
alias ss="script/single_spec -c --format=doc"

# Shorter git aliases, because those keystrokes matter...
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gs="git status"
alias gf="git fetch"
alias gd="git diff"

# Alias nexus mounting - see http://askubuntu.com/questions/207569/how-do-i-connect-a-nexus-7-to-transfer-files
# for more details
function android-connect () {
  echo "Connecting as sudo to /media/GalaxyNexus ..."
  sudo mtpfs -o allow_other /media/GalaxyNexus
  echo "Done!"
}

function android-disconnect () {
  echo "Disconnecting /media/GalaxyNexus..."
  sudo fusermount -u /media/GalaxyNexus
  echo "Done!"
}

# Shit I need for ack for some reason
export PERL5LIB=/home/esaunder/perl5/lib/perl5

PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PERL_MB_OPT="--install_base \"/home/esaunder/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/esaunder/perl5"; export PERL_MM_OPT;

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"