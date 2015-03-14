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

