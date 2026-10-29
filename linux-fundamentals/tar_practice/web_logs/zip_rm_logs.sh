#!/bin/bash
##only create for able cron test.
tar -zcvf logs_backup_$(date +%H%M).tar.gz *.log --remove-files
