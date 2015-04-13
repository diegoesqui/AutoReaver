#!/bin/bash

OS=`cat system.csv |grep OS|tr "," "\n"|tail -1`
INTERF=`cat system.csv |grep interface|tr "," "\n"|tail -1`

echo Starting wash
sudo wash -i mon0 -o victims.txt
