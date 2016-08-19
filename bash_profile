#	$Id: dot.profile,v 1.7.2.4 1998/03/07 11:42:06 jkh Exp $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# add /usr/games or /usr/X11R6/bin if you want
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/usr/games:/usr/local/bin:/home/private/bin:$HOME/bin; export PATH

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# TERM=cons25; 	export TERM

case `uname` in
  "FreeBSD")
	BLOCKSIZE=K;	export BLOCKSIZE
	EDITOR=vim;  	export EDITOR
	PAGER=jless;  	export PAGER
	#LANG=ja_JP.eucJP;	export LANG
#	LC_CTYPE=ja_JP.eucJP;	export LC_CTYPE
	CVSROOT=/home/cvsmaster;	export CVSROOT
	ZHDEF="~/bin/zen2han.def.news";	export ZHDEF
	;;
esac

# make mail(1) happy:
crt=24;		export crt

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.bashrc; export ENV
source $HOME/.bashrc
