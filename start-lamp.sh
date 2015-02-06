#!/bin/sh

# Services
SERVICENGINX='nginx'
SERVICEHTTP='httpd'
SERVICEMYSQL='mysqld'
SERVICE='.service'

checkall(){
 
#Check HTTPD
if ps ax | grep -v grep | grep $SERVICEHTTP > /dev/null

then
    echo -n "$SERVICEHTTP service running. You can (stop|restart|n)? "

	read answer 
		if [ $answer = "Stop" -o $answer = "stop" ] 
		then 
		echo "Stoping service…"
		systemctl stop $SERVICEHTTP$SERVICE

	fi

		if [ $answer = "Restart" -o $answer = "restart" ] 
		then 
		echo "Restarting service…"
		systemctl restart $SERVICEHTTP$SERVICE

	fi

else
    echo -n "$SERVICEHTTP is not running. Start it (y/n)? "
    #echo "$SERVICEHTTP is not running!" | mail -s "$SERVICEHTTP down" root
	
	#echo -n "Start it? Y/n ?"

	read answer 
		if [ $answer = "y" -o $answer = "Y" ] 
		then 
		echo "Starting service…"
		systemctl start $SERVICEHTTP$SERVICE

	fi

fi

#Check NGINX
if ps ax | grep -v grep | grep $SERVICENGINX > /dev/null

then
    echo -n "$SERVICENGINX service running. You can (stop|restart|n)? "

	read answer 
		if [ $answer = "Stop" -o $answer = "stop" ] 
		then 
		echo "Stoping service…"
		systemctl stop $SERVICENGINX$SERVICE

	fi

		if [ $answer = "Restart" -o $answer = "restart" ] 
		then 
		echo "Restarting service…"
		systemctl restart $SERVICENGINX$SERVICE

	fi

else
    echo -n "$SERVICENGINX is not running. Start it (y/n)? "
    #echo "$SERVICENGINX is not running!" | mail -s "$SERVICENGINX down" root
	SERVICENGINX='nginx.service'
	#echo -n "Found startap script - ${SERVICENGINX}. Start it? Y/n ?"

	read answer 
		if [ $answer = "y" -o $answer = "Y" ] 
		then 
		echo “Starting service…”
		systemctl start ${SERVICENGINX}

	fi

fi

#Check MYSQL
if ps ax | grep -v grep | grep $SERVICEMYSQL > /dev/null

then
    echo -n "$SERVICEMYSQL service running. You can (stop|restart|n)? "

	read answer 
		if [ $answer = "Stop" -o $answer = "stop" ] 
		then 
		echo "Stoping service…"
		systemctl stop $SERVICEMYSQL$SERVICE

	fi

		if [ $answer = "Restart" -o $answer = "restart" ] 
		then 
		echo "Restarting service…"
		systemctl restart $SERVICEMYSQL$SERVICE

	fi
else
    echo -n "$SERVICEMYSQL is not running. Start it (y/n)? "
	SERVICEMYSQLD='mysqld.service'

	#echo -n "Found startap script - ${SERVICEMYSQLD}. Start it? Y/n ?"

	read answer 
		if [ $answer = "y" -o $answer = "Y" ] 
		then 
		echo "Starting service…"
		systemctl start ${SERVICEMYSQLD}

	fi
fi

usage

}


# Functions

# If empty params

# check for valid usage

#if [ x$1 = 'x' ]
#then
#echo "Usage: $0 <email address>"
#exit 1
#fi

usage(){
	echo -e "--------------------------------------------------------\n"
	echo -e "\nYou can use script with arguments, example:\n\n $0 --help\n"
	#printf "1111\n22222\n\nYou can use arguments: $0 --help"
	exit 1
}

if [ $# -ne 1 ]; then
    checkall
    exit 1
fi

for i in "$@" ; do

    if [[ $i == "--help" ]] ; then
        echo $0: Can usage: Stop - stop all LAMP, Show - show services status
        break
    fi

    if [[ $i == "--usage" ]] ; then
        usage
        break
    fi

done