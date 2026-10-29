#!/bin/bash

### Have another on the log here, this script only use for create automation cron

grep -i "ERROR" server.log | awk '/from/ {print $NF}' | sort | uniq -c | sort -nr >> security_report_$(date +%Y%m%d).txt
