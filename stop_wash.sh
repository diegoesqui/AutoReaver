#!/bin/bash

echo Stoping wash
ps -ef|grep "wash -i en1"|grep -v grep|awk '{system("sudo kill -9 " $2)}'

