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

# file permissions: rwxr-xr-x
#
# umask	022

# Uncomment next line to enable the builtin emacs(1) command line editor
# in sh(1), e.g. C-a -> beginning-of-line.
# set -o emacs


# some useful aliases
#alias h='fc -l'
#alias j=jobs
#alias m=$PAGER
alias vi='/usr/local/bin/vim'
alias p=pwd
alias ls='ls -G'
alias l='ls -GF'
alias la='ls -aGF'
alias ll='ls -lgGF'
alias lla='ls -algGF'
alias g='egrep -i'
alias del='rm -f core* *~ *# ~/.[A-z]*~'
alias deltex='rm *% *~ *.aux *.log *.toc'
alias deltexall='rm *% *~ *.aux *.log *.toc *.dvi PS*.ps'
alias c='LC_CTYPE=C;export LC_CTYPE'
alias je='LC_CTYPE=ja_JP.eucJP;export LC_CTYPE'
alias jo='LC_CTYPE=ja_JP.UTF-8;export LC_CTYPE'
alias less='jless'
 
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
PS1="[\h:\u]\W_\!\$ "

# search path for cd(1)
# CDPATH=.:$HOME
