#!/bin/bash

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
__reset='\e[0m'


__echo_color() {
	if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
		echo "Usage: __echo_color color echo_arguments..."
		
		if [ $# -eq 0 ]; then
			return 2
		else
			return 0
		fi
	fi
	
	/bin/echo -e -n "$1"
	/bin/echo ${*:2}
	/bin/echo -e -n "$__reset"
}


__printf_color() {
	if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
		echo "Usage: __printf_color color printf_arguments..."
		
		if [ $# -eq 0 ]; then
			return 2
		else
			return 0
		fi
	fi
	
	printf "$1"
	printf ${*:2}
	printf "$__reset"
}

