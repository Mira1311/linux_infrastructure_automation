#!/bin/bash
set -e

for (( i=1; i<=50; i++))
do
	file_name=log_$(date +%Y%m%d)_$i.txt

	if [ -f "$file_name" ]; then
		echo "ERROR: File $file_name existed!" >&2
		exit 1
	fi

	touch "$file_name"
done

echo "File created successfully!"



