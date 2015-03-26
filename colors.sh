#!/usr/bin/env bash


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
	__help "Usage: __echo_color color echo_arguments..." $*
	
	/bin/echo -e -n "$1"
	/bin/echo "${*:2}"
	/bin/echo -e -n "$__reset"
}


__printf_color() {
	__help "Usage: __printf_color color printf_arguments..." $*
	
	printf "$1"
	printf ${*:2}
	printf "$__reset"
}

