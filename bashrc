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
# if [ -f $HOME/neovim/nvim ]
# then
export EDITOR=nvim
# else
#   export EDITOR=vi
# fi

export EXINIT="set notimeout"

# Basic path
# Disabling; this disables python shit from working in a vim terminal because
# petry amends the path, but running :terminal causes this file to be rerun...
# hopefully this is Fine
# PATH=""

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
  $HOME/android_sdk/android-studio/bin
  $HOME/exercism
  $HOME/vault
  $HOME/terraform
  $HOME/neovim
  ./node_modules/.bin
  $HOME/.poetry/bin
)

for i in ${path_items[@]}
do
  PATH=$PATH:$i
done

export PATH

# Enable elixir/erlang shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Android dev setup
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.android

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

# nested specific setup
if [ -f $HOME/scripts_nested/nested.bashrc ]; then
  source $HOME/scripts_nested/nested.bashrc
fi

# Exercism bash completion http://exercism.io/
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
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

# Mac stupid overrides
source "$HOME/scripts/git-completion.bash"

# Load in the git branch prompt script
# This is used in the PS1
source ~/scripts/set_prompt_status_mac.sh

# This will add up/down arrows and show untracked files
export GIT_PS1_SHOWDIRTYSTATE="auto"
export GIT_PS1_SHOWUPSTREAM=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1

function venv_string () {
  if [[ $(env | grep "^VIRTUAL_ENV") == "" ]]
  then
    echo ""
  else
    echo " 🐍"
  fi
}

export PROMPT_COMMAND='__git_ps1 "\[\033[0;36m\]\t\[\033[0;33m\]@\[\033[0;32m\]\w\[\e[0m\]" "\[\033[33m\]$(venv_string):> \[\e[0m\]"'

# if [ -f $HOME/neovim/nvim ]
# then
alias vi='nvim'
# fi

alias rs="bundle exec rspec -c --format=doc"
alias rc="bundle exec cucumber "
alias zs="zeus rspec -c --format=doc"
alias ss="script/single_spec -c --format=doc"
alias be="bundle exec"

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

function matrix() {
  # Could put this in ruby script but meh; thanks @Adzz!
  ruby -r io/console -e '
    system("clear")
    h, w = $stdin.winsize
    time = []
    def time.[](i)
      super || (
        moment = {green: [], white: [], off: []}
        self[i] = moment if 0 <= i
        moment
      )
    end
    def time.shift
      self[0]
      super
    end
    chars = [*32.chr..126.chr]
    print "\e[?25l"
    at_exit { print "\e[?25h"; exit! unless $! }
    loop do
      now = time.shift
      if rand < 0.2
        y, x = 0, 1 + rand(w)
        rate = (rand*10).to_i+1
        len  = rand(30) + 5
        1.upto(h+len) do |y|
          time[y*rate][:white] << [y, x]
          time[y*rate][:green] << [y-1, x]
          time[y*rate][:off]   << [y-len, x]
        end
      end
      to_ansi = -> pairs, chars { pairs.reject { |y, x| y <= 0 || h < y }.map { |y, x| "\e[#{y};#{x}H#{chars.sample}" } }
      print "\e[0m",  to_ansi[now[:off],   [" "]].join
      print "\e[37m", to_ansi[now[:white], chars].join
      print "\e[38;5;#{[22, 28, 34, 40, 46].sample}m", to_ansi[now[:green], chars].join
      sleep 0.001
    end'
}

# Shit I need for ack for some reason
export PERL5LIB=/home/esaunder/perl5/lib/perl5

PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PERL_MB_OPT="--install_base \"/home/esaunder/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/esaunder/perl5"; export PERL_MM_OPT;

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/home/esaunder/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Because awesome
# *SIGH* doesn't work for some reason
# eval $(thefuck --alias)

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export HISTIGNORE="&:vault*"
export VAULT_CACERT=/home/seddy/src/nested-tech/gcp-setup/vault/ca.crt
export VAULT_ADDR="https://127.0.0.1:8200"

# Because python :shrug:
export PYTHONPATH=.

# This is for installing node via asdf. They demand you download keys which I
# have no idea about the authenticity for before downloading. That's probably
# sensible but I always forget, and do that for literally nothing else on
# asdf.... so... fuck it, disabled.
export NODEJS_CHECK_SIGNATURES=no

# Ensure python3 is used in gcp cli stuff
export CLOUDSDK_PYTHON=python3

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/seddy/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/seddy/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/seddy/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/seddy/Downloads/google-cloud-sdk/completion.bash.inc'; fi
