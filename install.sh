#!/bin/bash

##############################################################
# installation script for friendish                          #
# red matrix posting script in  bash by tony baldwin         #
# http://tonyb.us/friendish                                  #
# released according to the terms of the GNU GPL v.3 or later#
##############################################################

if [ != "$HOME/bin/" ]; then
	mkdir $HOME/bin/
	$PATH=$PATH:/$HOME/bin/
	export PATH
fi

editor="/usr/bin/vim"

echo "installing friendish ... "
cp friendi.sh $HOME/bin/friendi.sh
chmod +x $HOME/bin/friendi.sh

echo "Creating config files ... "
echo "# friendi.sh config " > $HOME/.friendi.conf
read -p "Enter your Friendica username (e-mail address): " uname
read -p "Enter your Friendica password: " pwd
read -p "Enter your Friendica site url (no trailing slash, i.e. https://free-haven.org) " furl
read -p "Where do you wish to keep your post files? (such as ~/Documents/fposts/ This time DO include trailing slash.): " rpath
read -p "What is your prefered editor? (default /usr/bin/vim): " editor
read -p "What is your prefered web browser? (i.e. /usr/bin/iceweasel) " browser
echo "user=$uname" >> $HOME/.friendi.conf
echo "pass=$pwd" >> $HOME/.friendi.conf
echo "furl=$furl" >> $HOME/.friendi.conf
echo "rpostdir=$rpath" >> $HOME/.friendi.conf
echo "editor=$editor" >> $HOME/.friendi.conf
echo "browser=$browser" >> $HOME/.friendi.conf

echo "Installation complete!
To use friendi.sh, simply type "friendi.sh" at the command line and follow the prompts.
Enjoy! 
tony https://free-haven.org/u/tony"

exit
