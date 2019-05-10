#!/bin/bash
echo 'uninstalling Sinker'
#remove executables
sudo rm /usr/local/bin/sinker
#remove .config folder
rm -rf ~/.config/Sinker
echo '
'
echo 'fully uninstalled'
exit
