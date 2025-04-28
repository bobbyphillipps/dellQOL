# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[[ -f /etc/location ]] || /usr/local/bin/setlocation

# shortcuts

alias lp66='\cp /var/www/html/winpxe/nextboot.php.lp66 /var/www/html/nextboot.php'
alias lp64='\cp /var/www/html/winpxe/nextboot.php.lp64 /var/www/html/nextboot.php'