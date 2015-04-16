#!/bin/bash
#
# Inicializa la unidad WiFi para ponerla en "Monitor Mode"
#

#Detectando el sistema operativo
OS=`uname`
echo "OS,$OS" > system.csv

#Borro ficheros antiguos
rm -f victims*

if [ $OS == "Darwin" ]  # MAC OS X
	then
	echo OS detected: MAC OS
	INTERF="en1"
	echo Interface: $INTERF
	echo interface,$INTERF >> system.csv
	echo "Initializing wireless card as monitor"
	sudo airport $INTERF sniff 1 &
elif [ $OS == "Linux" ]  # LINUX
	then
	echo OS detected: Linux
	INTERF="wlan0"
	echo Interface: $INTERF
	echo interface,$INTERF >> system.csv

	echo "Hiding your MAC address"
	sudo ifconfig $INTERF down &
	sudo macchanger -m 00:11:22:33:44:55 $INTERF &
	sudo ifconfig $INTERF up &

	echo "Initializing wireless card as monitor"
	sudo airmon-ng start mon0 &
	sudo service network-manager stop mon0 &
fi
