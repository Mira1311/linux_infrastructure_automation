#!/bin/bash

while true
do
	memory=$(free -h -m) 
	echo -e "Current time: $(date) and free memory recorded here is \n ${memory}"
	sleep 12
done
 
