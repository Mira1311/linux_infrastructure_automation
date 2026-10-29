#!/bin/bash
### THE SCRIPT USING TO HANDLE THE LOG FILE WITH SOME SWITCH CASE TO REDUCED A LOT OF CODE LINES
target_file=/home/minoru/new_exercise_per_day/linux-fundamentals/logs/server.log
opt=$1
targeting=$2

case "$opt" in
	"--nfilter")
		echo "=== FILTER ${targeting} case-sensitive ==="
		grep "${targeting}" ${target_file}
		;;
	"--casefilter")
		echo "=== FILTER ${targeting} non-case sensitive and lines"
		grep -ni "${targeting}" ${target_file}
		;;
	"--count")
		echo "=== COUNT how much ${targeting} lines exists"
		grep -c -i "${targeting}" ${target_file}
		;;
	"--verbose")
		echo "=== Displaying lines except which contains "${targeting}""
		grep -v "${targeting}" ${target_file}
		;;
	"--head")
		if [[ -n "$targeting" && ! "$targeting" =~ ^[0-9]+$ ]]; then
			echo "ERROR: Argument of head must be a number!"
			exit 1
		fi
		
		lines="${targeting:-5}"
		echo "You're asking to displaying first "${lines}" lines"
		head -n "${lines}" "${target_file}"
		;;
	"--tail")
		if [[ -n "$targeting" && ! "$targeting" =~ ^[0-9]+$ ]]; then
			echo "ERROR: Argument of tail must be a number!"
			exit 1
		fi	
	        lines="${targeting:-5}"
		echo "You're asking to displaying last "${lines}" lines"
		tail -n "${lines}" "${target_file}"
		;;
	"--lookat")
		echo "You're want to take which IP with your targeting ranking"
		grep -i "${targeting}" ${target_file} | awk '/from/ {print $NF}' | sort | uniq -c | sort -nr
		;;
	*)
		echo -e "You're wrong there. The basic running script must be like: ./file_name --opt targeting \n
		We have 4 options: \n
		1, --nfilter: Normal filter what you want with case-sensitive. \n
		2, --casefilter: Filter what you want to seek non case-sensitive. \n
		3, --count: Count how much word you want to filter lines exists. \n
		4, --verbose: Displaying lines except which contains your wanted words. \n
		5, --head: Display how much first lines of the file you want. \n
		6, --tail: Display how much last lines of the file you want. \n
		7, --lookat: Display the ranking IP with the targeting word."
		
esac

