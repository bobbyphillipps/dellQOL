#!/bin/bash

# Set PS3 prompt
PS3="What would you like to do? "

# set action list
	echo 'Terminator : Install and copy terminator configuration.'
	echo 'Update : Updated Terminator'
	echo 'Push : Push the configuration files out to their proper location'
	echo 'Pull : Pull the files from their location; compress them and prepare them to upload to github'
select action in Terminator Update Push Pull Quit
	

	do
		case $action in
			Terminator)
		                #Install terminator
				yum install -y terminator
				mkdir -p ~/.config/terminator
				cp ./config ~/.config/terminator/
				break
			;;
			Update)
				yum update -y terminator	
				break
			;;
			Push)
				echo "Copying Files to their correct location"
				cp ./jtaliases.sh /etc/profile.d/	
				cp ./JT.sh /var/ftp/pub/test_scripts/NULL/PXE_Scripts/
				break
			;;
			Pull)
				echo "Gathering of the files is complete"
				cp ~/.config/terminator/config ./
				cp /etc/profile.d/jtaliases.sh ./
				cp /var/ftp/pub/test_scripts/NULL/PXE_Scripts/JT.sh ./
				git add .
				git commit -m "Latest and greatest update pulled with script."
				git push
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

