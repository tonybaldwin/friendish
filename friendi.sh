#!/bin/bash
 
# update friendica with bash, vim and curl
# I put this in my path as "friendi.sh"
# by tony baldwn, http://tonybaldwin.me
# on friendica at http://free-haven.org/profile/tony
# released according to the Gnu Public License, v.3
 
source ~/.friendi.conf
cd $fpostdir
let snet=twit=fb=dw=lj=tum=wp=lt=pp=0
filedate=$(date +%m%d%y%H%M%S)
 
# if you did not enter text for update, the script asks for it
 
if [[ $(echo $*) ]]; then
	ud="$*"
	title="posted with friendi.sh"
else
# Yes. You could use "emacs", "nano", "joe", "pico", or $EDITOR, 
# or, even, a gui editor, if you prefer (but why? it's a CLI tool), 
# but why bother yourself with inferior editors?
	$editor $filedate.fpost
	ud=$(cat $filedate.fpost)
	read -p "enter a title: " title
fi
 

read -p "Will you be crossposting? (y/n) " xpo

if [[ $xpo == y ]]; then
	# now to see if you want to crosspost elsewhere
	echo "For the following question regarding crossposting, please enter the number 1 for yes, and 0 for no."
	echo "Would you like to crosspost to "
	read -p "statusnet? " snet
	read -p "twitter? " twit
	read -p "facebook? " fb
	read -p "dreamwidth?  " dw
	read -p "livejournal? " lj
	read -p "tumblr? " tum
	read -p "wordpress? " wp 
	read -p "libertree? " lt 
	read -p "pump.io? " pp
fi
 
# and this is the curl command that sends the update to the server
 
if [[ $(curl --ssl -u $user:$pass -d "status=$ud&title=$title&ljpost_enable=$lj&dwpost_enable=$dw&wppost_enable=$wp&tumblr_enable=$tum&facebook_enable=$fb&twitter_enable=$twit&statusnet_enable=$snet&libertree_enable=$lti&pumpio_enable=$pp&source=friendi.sh" $furl/api/statuses/update.xml | grep error) ]]; then
 
# what does the server say?
 
	echo "Error"
else 
	echo "Success!"
	echo $ud
        read -p "Shall we have a look in your a browser now? (y/n): " op
 
        if [ $op = "y" ]; then
	     $browser $furl/profile/$user
        fi
 
fi
exit

