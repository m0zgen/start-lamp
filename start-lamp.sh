#!/bin/sh
SERVICEHTTP='httpd'
SERVICEMYSQL='mysqld'
 
if ps ax | grep -v grep | grep $SERVICEHTTP > /dev/null

then
    echo "$SERVICEHTTP service running"

else
    echo "$SERVICEHTTP is not running"
    #echo "$SERVICEHTTP is not running!" | mail -s "$SERVICEHTTP down" root
	SERVICEHTTPD='httpd.service'
	echo -n "Found startap script - ${SERVICEHTTPD}. Start it? Y/n ?"

	read answer 
		if [ $answer = "y" -o $answer = "Y" ] 
		then 
		echo “Starting service…”
		systemctl start ${SERVICEHTTPD}

	fi

fi

if ps ax | grep -v grep | grep $SERVICEMYSQL > /dev/null

then
    echo "$SERVICEMYSQL service running"
else
    echo "$SERVICEMYSQL is not running"
	SERVICEMYSQLD='mysqld.service'

	echo -n "Found startap script - ${SERVICEMYSQLD}. Start it? Y/n ?"

	read answer 
		if [ $answer = "y" -o $answer = "Y" ] 
		then 
		echo “Starting service…”
		systemctl start ${SERVICEMYSQLD}

	fi
fi
