#!/usr/bin/env bash

# Robert 'Bobby' Zenz
# https://github.com/RobertZenz/BobbysBashDir
# Licensed as Public Domain or Creative Commons Zero


# Text Color
__tblack='\e[30m'
__tred='\e[31m'
__tgreen='\e[32m'
__tyellow='\e[33m'
__tblue='\e[34m'
__tpurple='\e[35m'
__tcyan='\e[36m'
__twhite='\e[37m'

# Background Color
__bblack='\e[40m'
__bred='\e[41m'
__bgreen='\e[42m'
__byellow='\e[43m'
__bblue='\e[44m'
__bpurple='\e[45m'
__bcyan='\e[46m'
__bwhite='\e[47m'

# Text Bold
__tbold='\e[1m'

# Text Underline
__tunderline='\e[4m'

# Color Reset
__treset='\e[0m'


__echo_color() {
	__help "Usage: __echo_color color echo_arguments... or pipe input" $*
	
	/bin/echo -e -n "$1"
	
	if [ ${#*} -ge 2 ]; then
		/bin/echo "${*:2}"
	else
		while read line; do
			/bin/echo "$line"
		done < /dev/stdin
	fi
	
	/bin/echo -e -n "$__treset"
}


__printf_color() {
	__help "Usage: __printf_color color printf_arguments... or pipe input" $*
	
	printf "$1"
	
	if [ ${#*} -ge 2 ]; then
		printf ${*:2}
	else
		while read line; do
			printf -- "$line\n"
		done < /dev/stdin
	fi
	
	printf "$__treset"
}

