#!/bin/bash
touch /tmp/system_health.log
while true
do
	echo "System healthy at $(date)">>/tmp/system_health.log
        sleep 10
done

 
