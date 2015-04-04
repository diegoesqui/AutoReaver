#!/bin/bash
#
# Captura el pid de los procesos "Airport" y los mata
#

echo Stopping Airport
ps -ef|grep "airport en1 sniff 1"|grep -v grep|awk '{system("sudo kill -9 " $2)}'

