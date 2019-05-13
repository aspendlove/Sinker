# Sinker
**Sinker is a wrapper for Rsync, and it's purpose is to simplify the process of syncing two folders together while preserving file attributes, and copying only what has changed. Instead of having to use complicated command arguments with Rsync, Sinker asks you questions and does the hard work for you. You can also setup projects that save your settings and folders so that redundant tasks can go really quickly.**


----
# Installation

**To install run these commands in a terminal (you will need the program git installed beforehand)**

    cd Downloads

    git clone https://github.com/copperly123/Sinker.git

    cd Sinker

    ./install.sh

**You can also install it without git, but it includes more steps.**

First click the button on this repository that says "clone or download" and then click download zip. Then download it in your downloads folder and run these commands in the terminal.

    cd Downloads

    unzip Sinker-master.zip

    cd Sinker-master

    ./install.sh

**After you do either of these methods, your terminal will be running the install script. It will ask you if you want to install rsync, which is needed to run the program, if you're unsure then choose yes. After that it will ask you which package manager you use, which is the program that is used to install software. It lists the names as well as the distributions that use each one. After that it will install sinker and you may have to reboot (if you do it will tell you)**

**Be sure to read all the messages in the install script, they contain important information**

**After it is fully installed you can delete the Sinker folder in Downloads.**

---

# uninstallation
**To uninstall run these commands in a terminal.**

cd ~/.config/Sinker/

./uninstall.sh

---

# To use go into the terminal and type in "sinker" as shown below

![alt text](https://github.com/copperly123/Sinker/blob/master/Images/sinkercommand.png)

And it will ask you what you want your source directory to be. This is the folder that you want to sync another folder with. What you will need to do is type in the path to the folder relative to the home directory and then hit enteras. For example, if you want to sync another folder with Documents, then you would type in Documents/ It is important to note that you cannot have spaces in your folder names. if you wanted to sync a folder inside of documents called Projects, you would type Documents/Projects/ and so on. You can also find the path by navigating to the folder you want in your file browser, right click and choose "open in terminal" and you will see something like this.

![alt text](https://github.com/copperly123/Sinker/blob/master/Images/folderproperties.png)

If you look at the highlighted area, you can see all the folders that you will need to type. From this example, you would type Documents/Computer/Gaming/Wireframe/
If you want to sync a folder outside of your home directory, you have to start the path with a / and this indicates to start at the root directory rather than the home directory. If you don't know what this means then don't worry about it.


After you type in the source directory, it will ask for the Destination directory. This is the folder that will be changed to match the fist one. You will have to format it the same way as before

Next it asks you if you want to delete files in the destination directory that are not present in the source directory. To answer yes you type y, and to answer no you type n

Finally it gives you a summary of what you're doing, and then asks you to confirm. Again, type y for yes and n for no. If you type y, then it will sync the folders based on what you specified. If you type n, then it will exit and no changes will be made.

---

# Aliases

Aliases are a feature implemented into Sinker that allows you to set nicknames certain folders so that you don't have to type out the full path every time. You can have up to ten aliases. To set one up type "sinker -a" (-a stands for alias) into the terminal and a this screen will show up.

![alt text](https://github.com/copperly123/Sinker/blob/master/Images/aliassetup.png)

After running the command it will ask you what you want the alias to be named, or what you want to type in instead of the full path. you can name this anything you want with alphabetic characters and numbers (this is shown in the second highlighted box).

The second thing it will ask you is where you want it to point, which means what folder do you actually want to use when you put in the alias. You need to input this exactly as you would if you were just running the command regularly (see the "How to use section"). After you type that in and hit enter the alias will be added.

If you want to see and edit your aliases, you can type in sinker -al (-al stands for alias list) It will open the file where they're all stored in the text editor nano (shown below) (the file is in ~/.config/Sinker/ and is called aliases.sh). each alias will include a "name" and "directory" that are numbered (name1, name2, name3). You can edit the values inside of the single quote marks, or delete aliases altogether. Be sure to keep them in order though (name1, directory1, name2, directory2, etc.)

![alt text](https://github.com/copperly123/Sinker/blob/master/Images/aliaslistnano.png)

To use an alias, run sinker and type in the name of the alias in a place where you would normally type the path to the folder. You will see a message that says "alias found".

---

# Projects

Another feature of sinker is projects, which allow you to autofil the settings with predefined values. This allows you to skip everything except the confirmation.

To set one up run "sinker -p" and a message will come up like the one below

![alt text](https://github.com/copperly123/Sinker/blob/master/Images/setupproject.png)

The things it asks will be very similar to running the sinker command regularly. The first thing it asks is for the name of the project, or the thing you want to type to activate it. This is the same as the alias setup, It only can use letters and numbers with no spaces. 
Then after that it will ask you for the source directory (you can use an alias here if you want) and the destination directory. The last thing it will ask you for is whether you want to delete files in the destination that are not in the source. After that, the project is setup.

To view your projects, simply run sinker -pl (-pl stands for project list) and the file will open up in your terminal, just like with aliases.(the file is located in ~/.config/Sinker/ and is called projects.sh)

![alt text](https://github.com/copperly123/Sinker/blob/master/Images/projectlistnano.png)

It contains four things per project, the name (proname), the source, the destination, and the value of delete (prodelete). You can edit any of these values manually or delete them, but be sure to keep them in numerical order.

To use a project, type in the project name on the first question when you run sinker (there is a little message saying "if you have a project setup then input it here)

---

# Changing the rsync commands

If for any reason you want to change the rsync commands that are run, then you can run sinker -r. A file will be opened with nano in the terminal (the file is located in ~/.config/Sinker/ and is named rsync_commands.sh). You can edit the commands highlighted below, ($1 will be replaced with the source directory, and $2 will be replaced with the destination directory)

![alt text](https://github.com/copperly123/Sinker/blob/master/Images/rsynccommands.png)

---

# Issues with the program

If you have any questions or issues about this program, feel free to open an issue in the issues tab of this repository. I will try to respond as quickly as I can.

---

# All Files used by the program

**Stored in /usr/local/bin/**

sinker -- the main program's code

**Stored in ~/.config/Sinker/**

aliases.sh -- a shell script where all the aliases are stored

projects.sh -- a shell script where all the projects are stored

rsync_commands.sh -- a shell script where you can edit the rsync commands

uninstall.sh -- a shell script used to completely uninstall the program

---

# All Commands


sinker -- runs the program

sinker -a -- creates a new alias

sinker -al -- lists and allows you to edit/delete all of your aliases

sinker -p -- creates a new project

sinker -pl -- lists and allow you to edit/delete all of your aliases

sinker -r -- allows you to edit the rsync commands that are run
