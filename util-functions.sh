#!/bin/bash


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

__oneline() {
	while read line; do
		echo $line
	
		local remaining=$(($(tput cols)-${#line}))
	
		if [ $remaining -gt 0 ]; then
			__cursor_up 1
			local line=""
			for counter in $(seq $remaining); do
				line="$line "
			done
			echo $line
		fi
	
		__cursor_up 1
	done < /dev/stdin
}

__task_ok() {
	__cursor_up 1
	__cursor_forward 1
	__echo_color $__tgreen -n OK
	echo
}

__task_start() {
	echo "[  ] $*"
}

