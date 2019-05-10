#!/bin/bash
#variable to check if you need to restart
restart=0
#check if usr/local/bin exists
if [ ! -d "/usr/local/bin/" ]
then
	#if so then create it
	sudo mkdir /usr/local/
	sudo mkdir /usr/local/bin/
	#and add it to path
	export PATH=$PATH:/usr/local/bin
	#and set the reset flag
	restart=1
fi
echo 'Installing Sinker'
#give all executables executable permissions
sudo chmod +x sinker aliases.sh uninstall.sh rsync_commands.sh
#copy executables to /usr/local/bin
sudo cp sinker /usr/local/bin
if [ ! -d "~/.config/Sinker/" ]
then
	#create it if it doesn't already exist
mkdir ~/.config/Sinker/
fi
cp aliases.sh ~/.config/Sinker/
cp rsync_commands.sh ~/.config/Sinker/
echo '
'
#check if the restart flag is set
if [ $restart != 1 ]
then
	#if not then tell the user that the program is installed
	echo "fully installed"
else
	#if so then tell the user that they will need to restart
	echo "you will need to reboot to fully install"
fi
exit
