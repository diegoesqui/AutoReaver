#!/bin/bash
#
# Main File
#

user_interrupt(){
        echo "\n\nKeyboard Interrupt detected."
        sleep 2
		./kill_AirportSniff.sh
		echo "end of script!"
}

echo Log as super user
sudo echo logged

./start_AirportSniff.sh
./start_wash.sh
echo "Searching..."
sleep 10s
./stop_wash.sh
./sort_victims.sh
./start_reaver.sh
./kill_AirportSniff.sh

echo "end of script!"