#!/usr/bin/env bash


__prompt() {
	local currentdir=$1
	
	local separator="·"
	
	local userid=$(id --user)
	
	local prompt="$"
	
	local username=$(id --user --name)
	if [ $userid -eq 0 ]; then
		prompt="#"
		username=$__tred$username$__reset
	fi
	
	local hostname=$(hostname)
	hostname=$__hostcolor$hostname$__reset
	
	local date=$(date "+%I:%M:%S %p")
	
	local exitcode=$(printf "% 4d" "$2")
	if [ $exitcode -eq 0 ]; then
		exitcode=$__tgreen$exitcode$__reset
	else
		exitcode=$__tred$exitcode$__reset
	fi
	
	local gitinfo=""
	# Test if we're within a git repository.
	$(git rev-parse > /dev/null 2>&1)
	if [ $? -eq 0 ]; then
		local gitrepo=$(git rev-parse --show-toplevel)
		local gitrepo=$(basename "$gitrepo")
		local gitbranch=$(git rev-parse --abbrev-ref HEAD)
		local gitcommit=$(git rev-parse --short HEAD)
		gitinfo=" $separator $__tyellow$gitrepo$__reset@$__tyellow$gitbranch$__reset@$__tyellow$gitcommit$__reset"
	fi
	
	local line=""
	
	for counter in $(seq $(tput cols)); do
		line=$line$separator
	done
	
	/bin/echo -e "$line"
	/bin/echo -e "$username@$hostname · $exitcode$gitinfo · $date"
	/bin/echo -en "$currentdir$prompt "
}

