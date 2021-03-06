#	$Id: dot.shrc,v 1.1 1997/08/03 18:37:46 wosch Exp $
#
# .shrc - bourne shell startup file 
#
# This file will be used if the shell is invoked for interactive use and
# the environment variable ENV is set to this file.
#
# see also sh(1), environ(7).
#

# add /usr/games or /usr/X11R6/bin if you want
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/usr/local/bin:/usr/games:/home/private/bin:$HOME/bin; export PATH

if [[ -t 0 ]]; then
	stty stop undef
	stty start undef
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# file permissions: rwxr-xr-x
#
# umask	022

# Uncomment next line to enable the builtin emacs(1) command line editor
# in sh(1), e.g. C-a -> beginning-of-line.
# set -o emacs

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4000
HISTFILESIZE=8000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -f "/usr/share/source-highlight/src-hilite-lesspipe.sh" ]; then
	export LESS="--no-init -X --quit-if-one-screen --ignore-case --jump-target=10 -J10 --long-prompt --tabs=4 --RAW-CONTROL-CHARS"
	export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [ -f "/usr/local/bin/src-hilite-lesspipe.sh" ]; then
	export LESS="--no-init -X --quit-if-one-screen --ignore-case --jump-target=10 -J10 --long-prompt --tabs=4 --RAW-CONTROL-CHARS"
	export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi

	case `uname` in
	  "FreeBSD") color_prompt=yes;;
	esac
fi

if [ "$color_prompt" = yes ]; then
 case `uname` in
  "FreeBSD")
#	PS1="`whoami`@`hostname | sed 's/\..*//'`"
#    PS1='\u@\h:\w\$ '
#	PS1='\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
	PS1='\[\033[01;36m\]`__git_ps1`\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
	;;
  *)
#	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
#	PS1='${debian_chroot:+($debian_chroot)}\[\033[36m\]`__git_ps1`\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $ '
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]`__git_ps1`\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $ '
	;;
 esac
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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
  if [ -f /usr/local/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/local/share/git-core/contrib/completion/git-prompt.sh
  fi
fi

# some useful aliases
#alias h='fc -l'
alias j=jobs
alias u=uptime
#alias m=$PAGER
alias c='cd ..;pwd;ls -GF'
alias cdp='cd $OLDPWD'
alias p=pwd
#alias ls='ls --color=auto'
alias l='ls -GF'
alias la='ls -aGF'
alias ll='ls -lgGF'
alias lla='ls -algGF'
alias g='egrep -i'
alias del='rm -f core* *~ *# ~/.[A-z]*~'
alias deltex='rm *% *~ *.aux *.log *.toc'
alias deltexall='rm *% *~ *.aux *.log *.toc *.dvi PS*.ps'
alias gist='git status'
alias gitdiff='git difftool --tool=vimdiff --no-prompt'
case `uname` in
  "Linux")
	alias vvv='cd ../hdd/video'
	alias ls='ls -G --color=auto'
	export LSCOLORS="cxfxcxdxbxegedabagacad"
# Filename is default(00), directry name is bold(01) - cyan(36), symbolic link is bold(01) - blue(34).
#	export LS_COLORS="no=00:fi=00:di=01;36:ln=01;34"
	;;
  "FreeBSD")
	export LSCOLORS="cxfxcxdxbxegedabagacad"
	alias ce='LC_CTYPE=C;export LC_CTYPE'
	alias je='LC_CTYPE=ja_JP.eucJP;export LC_CTYPE'
	alias jo='LC_CTYPE=ja_JP.UTF-8;export LC_CTYPE'
#	alias less='jless'
        if [ -f /usr/local/bin/vim ]; then
	  alias vi='/usr/local/bin/vim'
        fi
	if [ -f /usr/local/share/git-core/contrib/completion/git-completion.bash ]; then
	  source /usr/local/share/git-core/contrib/completion/git-completion.bash
	fi
	;;
esac
alias view='vim -R'

if [ -f /usr/bin/vim ]; then
	export EDITOR="/usr/bin/vim"
elif [ -f /usr/local/bin/vim ]; then
	export EDITOR="/usr/local/bin/vim"
else
	export EDITOR="/usr/bin/vi"
fi
 
# # be paranoid
# alias cp='cp -ip'
# alias mv='mv -i'
# alias rm='rm -i'


# # set prompt: ``username@hostname$ '' 
# PS1="`whoami`@`hostname | sed 's/\..*//'`"
# case `id -u` in
# 	0) PS1="${PS1}# ";;
# 	*) PS1="${PS1}$ ";;
# esac
#PS1="[\h:\u]\W_\!\$ "

# search path for cd(1)
# CDPATH=.:$HOME
