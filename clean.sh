#!/bin/bash
#
# Limpieza y desactivacion de "Monitor Mode"
#


OS=`cat system.csv |grep OS|tr "," "\n"|tail -1`
INTERF=`cat system.csv |grep interface|tr "," "\n"|tail -1`

echo Cleaning system

if [ $OS == "Darwin" ]  # MAC OS X
	then
	# Captura el pid de los procesos "Airport" y los mata	
	ps -ef|grep "airport en1 sniff 1"|grep -v grep|awk '{system("sudo kill -9 " $2)}'
elif [ $OS == "Linux" ]  #Linux
	then
	sudo ifconfig $INTERF down &
	sudo airmon-ng stop $INTERF &
	sudo macchanger -p $INTERF &
	sudo airmon-ng start $INTERF &
	sudo ifconfig $INTERF up &
fi
