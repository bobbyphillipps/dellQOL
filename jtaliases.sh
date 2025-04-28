#######
alias cls='clear'
##########
#my alias
alias edal='vim /etc/profile.d/jtaliases.sh && source /etc/profile.d/jtaliases.sh'
alias lsal='less /etc/profile.d/jtaliases.sh'
alias resrc='source /etc/profile.d/jtaliases.sh'
alias tl='tail -f /var/log/messages'
alias ipo='tail -f /var/lib/dhcpd/dhcpd.leases | grep 192.168.*'
alias ipl='less /var/lib/dhcpd/dhcpd.leases | grep 192.168.*'
#alias ipj='awk -F' ' '/192.168.*/ {if(! a[$2]){print; a[$2]++}}' /var/lib/dhcpd/dhcpd.leases'
alias rh='vi /root/.ssh/known_hosts'
alias nh='/dev/null > /root/.ssh/known_hosts'
alias ndh='/dev/null > /var/lib/dhcpd/dhcpd.leases && service dhcpd restart && service network restart'
alias ipp='/usr/bin/nc -l -k 8005'

#PXE script locations
px=/var/ftp/pub/test_scripts/NULL

######
###The correct awk command. Now to get it to display correctly
#####
#
#awk -F' ' '/192.168.*/ { print $2 }\' /var/lib/dhcpd/dhcpd.leases
#
####
#alias iop='tail -f /var/lib/dhcpd/dhcpd.leases | awk -F\' \' \'{ print $2 }\' | grep 192.168.*'

###
###function to ssh
ssh192func() {
	scp ~/Desktop/dellQOL/remotealias.sh root@192.168.$1:~/.bashrc
	ssh 192.168.$1
}
alias ss='ssh192func'
###
#########

sshs() {
	scp ~/Desktop/dellQOL/remotealias.sh root@192.168.$1:~/.bashrc
	ssh 192.168.$1
}

alias sst='sshs'

###
###function to ping
png192func() {
	ping 192.168.$1
}
alias pss='png192func'
###
#########


###
###function to identify sled
sshidentify() {
	ssh 192.168.$1 "ipmitool chassis identify 3"
}
alias id='sshidentify'
###
#########


###
###function to check fru for malformity on sled
sshfrucheck() {
        ssh 192.168.$1 "ipmitool fru print 0"
}
alias fruchk='sshfrucheck'
###
#########

###
###Function to scp the pxe files to sled
###
sch192func() {
        scp -r /var/ftp/pub/test_scripts/NULL/PXE_Scripts root@192.168.$1:/tmp/
        ssh 192.168.$1
}
alias pcp='sch192func'
###
######

####
###Function to clear dhcpd.leases and restart dhcpd and networking
####
dhcpdclear() {
        /dev/null > /var/lib/dhcpd/dhcpd.leases
        service dhcpd restart
        service network restart
}
alias ndh='dhcpdclear'
###
######

#ratascript() {
#
#	for i in {a..j};
#		do hdparm --security-unlock 'Autopilot' /dev/sd"$i"; hdparm --security-disable 'Autopilot' /dev/sd"$i"; hdparm --security-unlock 'AutoATAWindowsString12345678901' /dev/sd"$i"; hdparm --security-disable 'AutoATAWindowsString12345678901' /dev/sd"$i"; done
#
#}

alias qol='~/Desktop/dellQOL/qolupdate.sh && cd'

alias resfix='~/Desktop/dellQOL/resfix.sh'

alias snooze='~/Desktop/dellQOL/vmupdatesnooze.sh'

alias gitup='~/Desktop/dellQOL/gitup.sh'

#alias rata='ratascript'