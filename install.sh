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
echo "Do you want to isntall the dependency Rsync? (you will need this to use the program)"
read -p 'yes or no> ' yorn
if [ "${yorn}" = 'yes' ]
then
  echo '
  '
	echo "What package manager does your system use?"
	echo "1. apt (ubuntu/debian based)"
	echo "2. dnf (fedora based)"
	echo "3. eopkg (solus)"
	echo "4. other"
	read -p '1, 2, 3, or 4> ' pkgmgr
  echo '
  '
	if [ $pkgmgr = 1 ]
	then
		echo 'installing rsync using apt'
		sudo apt install rsync
	elif [ $pkgmgr = 2 ]
	then
		echo 'installing rsync using dnf'
		sudo dnf install rsync
	elif [ $pkgmgr = 3 ]
	then
		echo 'installing rsync using eopkg'
		sudo eopkg install rsync
	elif [ $pkgmgr = 4 ]
	then
		echo "you will need to install rsync yourself after this program is installed"
	else
		echo "please answer with 1, 2, 3, or 4 only"
		echo "you answered with" "$pkgmgr"
	fi
else
  echo '
  '
  echo 'alright'
fi
echo
echo
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
	echo "Fully installed, you can delete this folder if you want"
	echo "The uninstall script is located in ~/.config/Sinker/ and is named unisntall.sh"
	echo "For more information go to https://github.com/copperly123/Sinker and reference the section in the documentation on uninstalling"
else
	#if so then tell the user that they will need to restart
	echo "You will need to reboot to fully install, after that you can delete this folder if you want"
	echo "The uninstall script is located in ~/.config/Sinker/ and is named unisntall.sh"
	echo "For more information go to https://github.com/copperly123/Sinker and reference the section in the documentation on uninstalling"
fi
exit
