#!/bin/bash
echo "Do you want to unisntall the dependency Rsync? (you might have installed this while installing sinker)"
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
		echo 'purging rsync using apt'
		sudo apt purge rsync
    sudo apt autoremove
	elif [ $pkgmgr = 2 ]
	then
		echo 'removing rsync using dnf'
		sudo dnf remove rsync
	elif [ $pkgmgr = 3 ]
	then
		echo 'removing rsync using eopkg'
		sudo eopkg remove rsync
	elif [ $pkgmgr = 4 ]
	then
		echo "you will need to uninstall rsync yourself after this program is uninstalled"
	else
		echo "please answer with 1, 2, 3, or 4 only"
		echo "you answered with" "$pkgmgr"
	fi
else
  echo '
  '
  echo 'alright'
echo 'uninstalling Sinker'
#remove executables
sudo rm /usr/local/bin/sinker
#remove .config folder
sudo rm -rf ~/.config/Sinker
echo '
'
echo 'fully uninstalled'
exit
