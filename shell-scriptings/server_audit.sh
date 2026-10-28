#!/bin/bash


# Get username and current directory
username=$(whoami)
currentdir=$(pwd)

# Get IP address of user
ipaddr=$(hostname -I)

# Get the distribution of the current using Linux
curdist=$(lsb_release -ds)

# Get the current working processes
curwp=$(ps -e --no-headers | wc -l)

#Get the current time
cur_time=$(date)
FLAG=$1

case "$FLAG" in
	--json)
		cat <<EOF | sudo tee -a /var/log/custom_audit_json.json
{
	"timestamp": "$cur_time",
	"user": "$username",
	"home": "$currentdir",
	"ip_address": "$ipaddr",
	"os_version": "$curdist",
	"running_processes": "$curwp"
}
EOF
;;
	
--text|"")
	cat <<EOF | sudo tee -a /var/log/custom_audit.log > /dev/null
	=== AUDIT REPORT ===
	Time: ${cur_time}
	User: ${username}
	Directory: ${currentdir}
	Internal IP address: ${ipaddr}
	Distribution version: ${curdist}
	Running processes: ${curwp}
EOF
;;
*)
	echo "ERROR: Flag "$FLAG" cannot accepted"
	;;
esac
