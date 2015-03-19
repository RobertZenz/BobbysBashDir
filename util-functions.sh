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
	local count=${2:-$(tput cols)}
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
		
		local remaining=$(($columns-${#line}))
	
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
	echo "[   ] $1"
	
	local error=$( { ${*:2} | __sameline 3 ; } 2>&1)
	
	local result=${PIPESTATUS[0]}
	
	__cursor_up
	__cursor_forward
	
	if [ $result -eq 0 ]; then
		__printf_color $__tgreen "%3d" $result
	else
		__printf_color $__tred "%3d" $result
	fi
	
	echo
	
	if [ ${#error} -gt 0 ]; then
		__echo_color $__tred "$errors"
	fi
}


