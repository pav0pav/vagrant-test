#!/bin/bash
PID=/etc/ppp/pppoe.pid
MAX=100
INTERFACE=eth0
BASE=192.100.100.100-200
MYIP=192.100.100.1
if [ -f $PID ]
then
        kill $(cat $PID)
        sudo rm -f $PID
fi
sudo /usr/sbin/pppoe-server -T 60 -I $INTERFACE -N $MAX -L $MYIP -R $BASE -X $PID