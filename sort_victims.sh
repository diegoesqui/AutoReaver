#!/bin/bash
#
# Sort the victims file
#

echo Sorting victims

# Copy the header to a new file
cat victims.txt|head -1 > victims_sorted.txt

# Sort the networks by signal (RSSI): better first
# and copy them to the new created file
cat victims.txt |sed 1,2d|sort -k3 >> victims_sorted.txt 

# Removes the old file
rm -f victims.txt