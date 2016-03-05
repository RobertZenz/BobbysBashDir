#!/usr/bin/env bash

# Robert 'Bobby' Zenz
# https://github.com/RobertZenz/BobbysBashDir
# Licensed as Public Domain or Creative Commons Zero


# Changes into each directory in the current directory and executes the given
# command, then goes back.
__alld() {
	__help "Usage: __alld command [options]..." $*
	
	for item in *; do
		if [ -d "$item" ]; then
			# Print the name of the current directory,
			__echo_color $__tblue "$item"
			
			# cd into the directory, execute the command and cd back.
			cd -- "$item"
			$*
			cd -
			
			# Add an empty line for nicer formatting.
			echo
		fi
	done
}


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
	
	# Read line by line from stdin
	while read line; do
		# echo the read line without a new line at the end,
		# so that we can fill the rest of the line.
		echo -n $line
		
		# The remaining number of characters of the line.
		local remaining=$((${COLUMNS:-$(tput cols)}-${#line}))
		
		if [ $remaining -gt 0 ]; then
			__line " " $remaining
		else
			echo
		fi
		
		# If we've echoed enough lines, we'll scroll back to the beginning.
		line_counter=$((line_counter+1))
		
		if [ $line_counter -ge $lines ]; then
			__cursor_up $line_counter
			line_counter=0
		fi
	done < /dev/stdin
	
	# Clear all the output and set the cursor back to the beginning.
	if [ $line_counter -lt $lines ]; then
		# Move to the beginning.
		if [ $line_counter -gt 0 ]; then
			__cursor_up $line_counter
		fi
		
		# Clear all lines.
		for counter in $(seq $lines); do
			__line " "
		done
		
		# Back to the beginning.
		__cursor_up $lines
	fi
}

__task() {
	__help "Usage: __task taskname command..." $*
	
	__echo_color $__tbold "[   ] $1"
	
	# stderr will go to this temp file because it is not possible that
	# capture it and still send stdout to somewhere else.
	local tmperr=$(mktemp)
	
	# Execute the command that we are supposed to execute.
	${*:2} 2> "$tmperr" | __sameline 1
	
	# Gets the exit code of the first command.
	local result=${PIPESTATUS[0]}
	
	# Reposition the cursor to insert the exit code.
	__cursor_up
	__cursor_forward
	
	if [ $result -eq 0 ]; then
		__printf_color $__tgreen "%3d" $result
	else
		__printf_color $__tred "%3d" $result
	fi
	
	# Get back onto the next line for further output.
	echo
	
	# If there is something in the err file, print it and then remove it.
	if [ -s "$tmperr" ]; then
		cat "$tmperr" | __echo_color $__tred
	fi
	rm "$tmperr"
	
	return $result
}

__waitforkey() {
	text="$*"
	
	if [ -z "$text" ]; then
		text="Please press a key to continue..."
	fi
	
	read -p "$text"
}

