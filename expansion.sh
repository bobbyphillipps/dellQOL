#!/bin/bash

 

function install {

#Install terminator

yum install -y terminator

mkdir -p ~/.config/terminator

 

#Making the terminator config file and putting it in the correct loction.      

cat > ~/.config/terminator/config <<-EOF

[global_config]

  window_state = maximise

[keybindings]

  broadcast_group = <Shift><Super>a

  broadcast_off = <Shift><Super>d

[profiles]

  [[default]]

    use_system_font = False

    font = Monospace 12

    foreground_color = "#00ff00"

[layouts]

  [[default]]

    [[[child1]]]

      type = Terminal

      parent = window0

    [[[window0]]]

      type = Window

      parent = ""

  [[four]]

    [[[child0]]]

      position = 0:25

      type = Window

      order = 0

      parent = ""

      size = 1920, 1002

    [[[child1]]]

      position = 960

      type = HPaned

      order = 0

      parent = child0

    [[[child2]]]

      position = 479

      type = HPaned

      order = 0

      parent = child1

    [[[child3]]]

      position = 501

      type = VPaned

      order = 0

      parent = child2

    [[[child6]]]

      position = 501

      type = VPaned

      order = 1

      parent = child2

    [[[terminal5]]]

      profile = default

      group = All

      type = Terminal

      order = 1

      parent = child3

    [[[terminal4]]]

      profile = default

      group = All

      type = Terminal

      order = 0

      parent = child3

    [[[terminal7]]]

      profile = default

      group = All

      type = Terminal

      order = 0

      parent = child6

    [[[terminal9]]]

      profile = default

      command = /usr/bin/nc -l -k 8005

      type = Terminal

      order = 1

      parent = child1

    [[[terminal8]]]

      profile = default

      group = All

      type = Terminal

      order = 1

      parent = child6

  [[two]]

    [[[child0]]]

      position = 0:25

      type = Window

      order = 0

      parent = ""

      size = 1920, 1002

    [[[child1]]]

      position = 960

      type = HPaned

      order = 0

      parent = child0

    [[[child2]]]

      position = 501

      type = VPaned

      order = 0

      parent = child1

    [[[terminal3]]]

      profile = default

      group = All

      type = Terminal

      order = 0

      parent = child2

    [[[terminal5]]]

      profile = default

      command = /usr/bin/nc -l -k 8005

      type = Terminal

      order = 1

      parent = child1

    [[[terminal4]]]

      profile = default

      group = All

      type = Terminal

      order = 1

      parent = child2

  [[one]]

    [[[child0]]]

      position = 0:25

      type = Window

      order = 0

      parent = ""

      size = 1920, 1002

    [[[child1]]]

      position = 960

      type = HPaned

      order = 0

      parent = child0

    [[[terminal3]]]

      profile = default

      command = /usr/bin/nc -l -k 8005

      type = Terminal

      order = 1

      parent = child1

    [[[terminal2]]]

      profile = default

      command = ""

      type = Terminal

      order = 0

      parent = child1

[plugins]

EOF

 

#Creating the Terminator Update shortcut for Terminator Update Command

cat > ~/Desktop/Terminator_Update.desktop <<-EOF

#!/usr/bin/env xdg-open

 

[Desktop Entry]

Version=1.0

Type=Application

Terminal=true

Icon=terminator

Name[en_US]=Terminator Update

Exec=yum update -y terminator

Comment[en_US]=Update terminator desktop shortcut

Name=Terminator Update

Comment=Update Terminator

 

EOF

chmod +x ~/Desktop/Terminator_Update.desktop

 

#Creating the Terminator Update shortcut for Terminator Update Command

cat > ~/Desktop/Terminator.desktop <<-EOF

[Desktop Entry]

Name=Terminator

Comment=Generic Single Terminator Window

TryExec=terminator

Exec=terminator

Icon=terminator

Type=Application

Categories=GNOME;GTK;Utility;TerminalEmulator;

StartupNotify=true

X-Ubuntu-Gettext-Domain=terminator

X-Desktop-File-Install-Version=0.15

 

EOF

chmod +x ~/Desktop/Terminator.desktop

 

}

 

function term1 {

#Creating the desktop shortcut for 1 terminator with ip address window

cat > ~/Desktop/terminator_one.desktop <<-EOF

 

[Desktop Entry]

Name=Terminator1

Comment=Multiple terminals in one window

TryExec=terminator

Exec=terminator -l one

Icon=terminator

Type=Application

Categories=GNOME;GTK;Utility;TerminalEmulator;

StartupNotify=true

X-Ubuntu-Gettext-Domain=terminator

X-Desktop-File-Install-Version=0.15

 

EOF

chmod +x ~/Desktop/terminator_one.desktop

}

 

 

function term2 {

#Creating the desktop shortcut for 2 terminator with ip address window

cat > ~/Desktop/terminator_two.desktop <<-EOF

 

[Desktop Entry]

Name=Terminator

Comment=Multiple terminals in one window

TryExec=terminator

Exec=terminator -l two

Icon=terminator

Type=Application

Categories=GNOME;GTK;Utility;TerminalEmulator;

StartupNotify=true

X-Ubuntu-Gettext-Domain=terminator

X-Desktop-File-Install-Version=0.15

Name[en_US]=Terminator2

 

EOF

chmod +x ~/Desktop/terminator_two.desktop

}

 

function term4 {

#Creating the desktop shortcut for 4 terminators with ip address window

cat > ~/Desktop/terminator_four.desktop <<-EOF

 

[Desktop Entry]

Name=Terminator

Comment=Multiple terminals in one window

TryExec=terminator

Exec=terminator -l four

Icon=terminator

Type=Application

Categories=GNOME;GTK;Utility;TerminalEmulator;

StartupNotify=true

X-Ubuntu-Gettext-Domain=terminator

X-Desktop-File-Install-Version=0.15

Name[en_US]=Terminator4

 

EOF

chmod +x ~/Desktop/terminator_four.desktop

}

 

function renet {

#Creating the desktop shortcut for Network Restart Command

cat > ~/Desktop/Network_Restart.desktop <<-EOF

#!/usr/bin/env xdg-open

 

[Desktop Entry]

Version=1.0

Type=Application

Terminal=true

Name[en_US]=Network Restart

Exec=service network restart

Comment[en_US]=restart the network services

Name=Network Restart

Comment=restart the network services

Icon=/usr/share/pixmaps/comps/network-tools.png

 

EOF

chmod +x ~/Desktop/Network_Restart.desktop

}

 

function tech {

cat > ./Tech.sh <<-'EOF'

#!/bin/bash

 

# Set PS3 prompt

PS3="What would you like to do? "

 

# set action list

echo ''

echo 'Screen : Used to disconnect and leave processes running'

echo 'Bios : Show current BIOS firware version'

echo 'Identify : Flash the Red Indicator Light on Sled for 3 Seconds'

echo 'Network Restart : Restart Network Service on sled'

echo 'Repeat Slayer : Repeat Slayer Shortcut and no performance test'

echo ''

#

select action in Screen Bios Identify 'Network Restart' 'Repeat Slayer' Quit

       

 

do

case $action in

Screen)

echo 'List : List the currently running screen sessions'

echo 'Start : Start Screen session Test'

echo 'Reconnect : Reconnect to Screen session Test'

select action in List Start Reconnect Quit

do

case $action in

List)

screen -ls

;;

Start)

screen -S test

break

;;

Reconnect)

screen -r test

break

;;

Quit)

echo "Quitting"

break

;;

*)

echo "Invalid Entry... Exiting!"

break

;;

esac

done

break

;;

Bios)

dmidecode -s bios-version

break

;;

Identify)

ipmitool chassis identify 3

break

;;

'Network Restart')

service network restart

break

;;

'Repeat Slayer')

echo 'Repeat Slayer : Normal Repeat Slayer'

echo 'No Performance : Repeat Slayer without Performance'

select action in 'Repeat Slayer' 'No Performance' Quit

do

case $action in

'Repeat Slayer')

/tmp/PXE_Scripts/Tools/Projects/Diag/Repeat_Slayer_run.sh

break

;;

'No Performance')

/tmp/PXE_Scripts/Tools/Projects/Diag/Repeat_Slayer_run.sh -p

break

;;

Quit)

echo "Quitting"

break

;;

*)

echo "Invalid Entry... Exiting!"

break

;;

esac

done

break

;;

Quit)

echo "Quitting"

break

;;

*)

echo "Invalid Entry... Exiting!"

break

;;

esac

done

 

EOF

 

chmod +x ./Tech.sh

mv ./Tech.sh /var/ftp/pub/test_scripts/NULL/PXE_Scripts/

}

 

##############################################

###### Creating the results log file #########

##############################################

touch ./results

 

whiptail --title "Terminator and Desktop Shortcuts Installer" --checklist --separate-output "Choose:" 20 80 15 \

"Install" "Install Terminator and add config file" off \

"Terminator1" "Create Terminator 1 screen split Desktop Icon  " off \

"Terminator2" "Create Terminator 2 screen split Desktop Icon  " off \

"Terminator4" "Create Terminator 4 screen split Desktop Icon  " off \

"Restart_Network" "Create Network Restart Desktop Icon" off \

"Tech" "" off 2>results

 

while read choice

do

        case $choice in

                Install) install

                ;;

                Terminator1) term1

                ;;

                Terminator2) term2

                ;;

                Terminator4) term4

                ;;

                Restart_Network) renet

                ;;

                              Tech) tech

                              ;;

                *)

                ;;

        esac

done < results

 

##############################################

###### Removing the results log file #########

##############################################

rm ./results
