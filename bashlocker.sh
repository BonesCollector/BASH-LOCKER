#!/bin/bash

HASH="c97ed61bcd4a4519a3e2ce9903c7a3e4"
MAXTRIES=2
TRIES=0
BB="\033[5m\033[1m"
RES="\033[0m"

text_center(){
	_COLUMNS=$(tput cols)
	_LINES=$(tput lines)
	x=$(( $_LINES / 2 ))
	y=$(( $_COLUMNS / 2 ))
	tput clear
	tput cup $x $y
}

pass_obtainer() {
        text_center
	tput setaf 2
	echo  -e """ 
		Date : $(date)                           User : $USER
		Online since : $(uptime)  
		Please enter your password to unlock the terminal >>\n
	         """
	read -s PASS
	PASS=`echo $PASS | md5sum | tr -d "-" | tr -d " "`
	
}                       


pass_attemp() {
	if     [ "$TRIES" -eq 0 ]
	then
           	text_center
		tput setaf 1
         	TRIES=$((TRIES + 1))
        	echo "Access Denied ! "
		sleep 1
		text_center
		echo "Failed Attempts $TRIES"
            	sleep 2
            	pass_obtainer

	elif    [ "$TRIES" -eq 1 ]
	then
        	TRIES=$((TRIES + 1))
        	text_center
		tput setaf 1
        	echo "Getting seroius be carfull ! "
		sleep 2
		text_center
		echo "Failed Attempts $TRIES"
		sleep 2
        	pass_obtainer

	elif	[ "$TRIES" -eq 2 ]  
	then
		TRIES=$((TRIES +1 ))
        	text_center
		tput bold
		tput setaf 1
		tput blink
		echo -e """${BB}Initiating self
	                                                    destruction sequence ..${RES}"""
		sleep 3
		text_center
		tput setaf 1
		echo 5
		sleep 1
		text_center
		echo 4
		sleep 1
		text_center
		echo 3
		sleep 1
		text_center
		echo 2
		sleep 1
		text_center
		echo 1
		sleep 1
		text_center
		echo 0
		sleep 3
		text_center
		echo -e  """\aKABOOOOOOOOOOOOO
		                                             OOOOOOOOOOOOOOOM """
		sleep 5
		pass_obtainer

	else
	TRIES=$((TRIES + 1))
	text_center
 	tput setaf 6	
	echo """
	                                      Seriously no word no pass.

                                 	       get it ? word pass !?  .. 
                              	                pass word !! Dah!!!
	     """
	sleep 4
	text_center
	echo "Failed Attempts : $TRIES"
	sleep 3
	pass_obtainer
	fi
}

while true : 
do
	trap ' ' 2 20
	pass_obtainer
	if [ "$PASS" == "$HASH" ] 
	then
		text_center
		echo " Weclome Back "
		sleep 2
	        clear	
		exit
	else
		pass_attemp
	fi
done
