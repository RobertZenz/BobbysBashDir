#!/usr/bin/env bash


# Glyphs:
#	‗	―	…	‾
#	☰ 	☱ 	☲ 	☳ 	☴ 	☵ 	☶ 	☷
#	⚊ 	⚋ 	⚌ 	⚍ 	⚎ 	⚏

__prompt() {
	local currentdir="$1"
	
	local line_glyph="-"
	local separator="·"
	
	local userid="$(id --user)"
	
	local prompt="$"
	
	local username="$(id --user --name)"
	if [ $userid -eq 0 ]; then
		prompt="#"
		username="$__tred$username$__treset"
	fi
	
	local hostname="$(hostname)"
	hostname="$__hostcolor$hostname$__treset"
	
	local date="$(date "+%H:%M:%S")"
	
	local exitcode="$(printf "% 4d" "$2")"
	if [ $exitcode -eq 0 ]; then
		exitcode="$__tgreen$exitcode$__treset"
	else
		exitcodetext=${__exit_codes[$2]}
		
		if [ -z "$exitcodetext" ]; then
			exitcodetext="???"
		fi
		
		exitcode="$__tred$exitcode$separator$exitcodetext$__treset"
	fi
	
	local gitinfo=""
	# Test if we're within a git repository.
	$(git rev-parse > /dev/null 2>&1)
	if [ $? -eq 0 ]; then
		local gitrepo=$(git rev-parse --show-toplevel 2> /dev/null)
		local gitrepo=$(basename "$gitrepo")
		local gitbranch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
		local gitcommit=$(git rev-parse --short HEAD 2> /dev/null)
		
		if [ -z "$gitcommit" ]; then
			gitcommit="???"
		fi
		
		gitinfo=" $separator $__tyellow$gitrepo$__treset@$__tyellow$gitbranch$__treset@$__tyellow$gitcommit$__treset"
	fi
	
	local line=""
	
	for counter in $(seq $(tput cols)); do
		line="$line$line_glyph"
	done
	
	/bin/echo -e "$line"
	/bin/echo -e "$username@$hostname $separator $date $separator $exitcode$gitinfo"
	/bin/echo -en "$currentdir$prompt "
}

