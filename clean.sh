#!/bin/bash
#
# Limpieza y desactivacion de "Monitor Mode"
#

OS=`uname`
echo Cleaning system

if [ $OS == "Darwin" ]  # MAC OS X
	then
	# Captura el pid de los procesos "Airport" y los mata	
	ps -ef|grep "airport en1 sniff 1"|grep -v grep|awk '{system("sudo kill -9 " $2)}'
elif [ $OS == "Linux" ]  #Linux
	then
	sudo airmon-ng stop wlan0
fi
