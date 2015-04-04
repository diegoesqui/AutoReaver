#!/bin/bash
#
# Inicializa la unidad WiFi para ponerla en "Monitor Mode"
#

OS=`uname`
echo "Initializing wireless card as monitor"

if [ $OS == "Darwin" ]  # MAC OS X
	then
	sudo airport en1 sniff 1 &
elif [ $OS == "Linux" ]  # LINUX
	then
	sudo airmon-ng start wlan0 &
fi
