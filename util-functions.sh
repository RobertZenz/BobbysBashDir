#!/usr/bin/env bash


__help() {
	if [ $# -eq 1 ] || [ "$2" = "-h" ] || [ "$2" = "--help" ]; then
		echo "$1"
		
		# Only terminate if we're inside a script.
		if [ -z "$PS1" ]; then
			if [ $# -eq 1 ]; then
				exit $__exit_noent
			else
				exit $__exit_norm
			fi
		fi
	fi
}

__line() {
	local char=${1- }
	local count=${2:-${COLUMNS:-$(tput cols)}}
	local filler=""
	
	for counter in $(seq $count); do
		filler="$filler$char"
	done
	
	echo "$filler"
}

__sameline() {
	local lines=${1:-1}
	
	local line_counter=0
	
	while read line; do
		echo -n $line
		
		local remaining=$((${COLUMNS:-$(tput cols)}-${#line}))
	
		if [ $remaining -gt 0 ]; then
			__line " " $remaining
		else
			echo
		fi
		
		line_counter=$((line_counter+1))
		
		if [ $line_counter -ge $lines ]; then
			__cursor_up $line_counter
			line_counter=0
		fi
	done < /dev/stdin
	
	if [ $line_counter -lt $lines ]; then
		if [ $line_counter -gt 0 ]; then
			__cursor_up $line_counter
		fi
		
		for counter in $(seq $lines); do
			__line " "
		done
		
		__cursor_up $lines
	fi
}

__task() {
	__echo_color $__tbold "[   ] $1"
	
	local tmperr=$(mktemp)
	
	${*:2} 2> "$tmperr" | __sameline 1
	
	local result=${PIPESTATUS[0]}
	
	__cursor_up
	__cursor_forward
	
	if [ $result -eq 0 ]; then
		__printf_color $__tgreen "%3d" $result
	else
		__printf_color $__tred "%3d" $result
	fi
	
	echo
	
	local errors=$(cat "$tmperr")
	rm "$tmperr"
	
	if [ ${#errors} -gt 0 ]; then
		__echo_color $__tred "$errors"
	fi
	
	# Only terminate if we're inside a script and exit code is not zero.
	if [ -z "$PS1" ] && [ $result -ne 0 ]; then
		exit $result
	fi
}

