#!/bin/bash

for ((i=1; i<=50; i++))
do
	rm -f /home/minoru/new_exercise_per_day/shell-scriptings/dummy_logs/*.txt
done
echo "Running delete script at $(date "+%Y-%m-%d %H:%M:%S")" >> /home/minoru/new_exercise_per_day/shell-scriptings/dummy_logs/cron_history.log

