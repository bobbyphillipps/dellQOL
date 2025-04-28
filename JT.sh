#!/bin/bash

# Set PS3 prompt
PS3="What would you like to do? "

# set action list
	echo 'Terminator : Install and copy terminator configuration.'
	echo 'Identify : Flash the Red Indicator Light on Sled for 3 Seconds'
#	echo ''
select action in Screen Bios Identify Quit
	

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

