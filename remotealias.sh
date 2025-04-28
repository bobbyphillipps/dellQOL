# .bashrc

#ignore local popups
[[ $- != *i* ]] && return

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias scp='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias dcs='cd /tmp/PXE_Scripts/; /tmp/PXE_Scripts/Launch_sustaining.sh'

export PS1='\[\e[0;36m\][\u@\h \W]#\[\e[m\]'

export VM=192.168.1.1
export HOMEBASE=$VM
export DBHOST=$VM
export PXEVM=$VM

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#Local menu popups
cd /tmp/PXE_Scripts/
/tmp/PXE_Scripts/healthcheck.sh
/tmp/PXE_Scripts/Launch_sustaining.sh


ratascript() {

	for i in {a..j};
		do hdparm --security-unlock 'Autopilot' /dev/sd"$i"; hdparm --security-disable 'Autopilot' /dev/sd"$i"; hdparm --security-unlock 'AutoATAWindowsString12345678901' /dev/sd"$i"; hdparm --security-disable 'AutoATAWindowsString12345678901' /dev/sd"$i"; done

}

alias rata='ratascript'

alias errormod='Tools/Samsung_NVME_Serial/ERRORMOD/Format_ERRORMOD_run.sh'