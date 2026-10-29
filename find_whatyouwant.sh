#/bin/bash
# THE SCRIPT USING TO FIND/DELETE ANY FILES with suffixes you want (tmp, logs,...)
opt=$1
target_extension=$2

case "$opt" in
	"--find")
		echo "Finding .${target_extension} files"
	        find . -name "*.${target_extension}" 
		;;
	"--delete")
		echo "Finding files and deleting with targeting extension '${target_extension}'"
		find . -type f -name "*.${target_extension}" -delete
		;;
	*)
		echo -e "You're wrong there, the basic running script must be like: ./file_name --opt target_extension \n
		We have 2 options: \n
		1, --find: Finding your target extension and list it to the screen.
		2, --delete: Finding your target extension and delete all of them without sharing to the screen."
esac	
