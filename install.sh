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
sudo chmod a+x sinker aliases.sh uninstall.sh rsync_commands.sh projects.sh
#copy executables to /usr/local/bin
sudo cp sinker /usr/local/bin
#check if ~/.config/Sinker/ exists
if [ ! -d ~/.config/Sinker/ ]
then
	#create it if it doesn't already exist
	mkdir ~/.config/Sinker/
fi
#copy all config files and unisntall.sh to ~/.config/Sinker/
cp aliases.sh ~/.config/Sinker/
cp rsync_commands.sh ~/.config/Sinker/
cp projects.sh ~/.config/Sinker/
cp uninstall.sh ~/.config/Sinker/
echo '
'
#check if the restart flag is set
if [ $restart != 1 ]
then
	#if not then tell the user that the program is installed
	echo "fully installed, you can delete this folder if you want"
	echo "the uninstall script is located in ~/.config/Sinker/ and is named unisntall.sh"
	echo "for more information go to https://github.com/copperly123/Sinker and reference the section on uninstalling"
else
	#if so then tell the user that they will need to restart
	echo "you will need to reboot to fully install, after that you can delete this folder if you want"
	echo "the uninstall script is located in ~/.config/Sinker/ and is named unisntall.sh"
	echo "for more information go to https://github.com/copperly123/Sinker and reference the section on uninstalling"
fi
exit
