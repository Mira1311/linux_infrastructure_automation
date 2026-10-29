#!/bin/bash
#This script create to check how much using disk right now

disk_usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

if [ "$disk_usage" -ge 10 ]; then
	echo "RED ALERT, the disk usage is greater than 10" >> /home/minoru/new_exercise_per_day/linux-fundamentals/disk_alert_practice
fi
	echo "ALL GOOD"
