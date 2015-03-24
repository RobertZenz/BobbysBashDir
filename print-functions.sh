#!/usr/bin/env bash

################################################################################
#                                                                              #
# Helper functions for centered printing of single-line and multi-line vars    #
#                                                                              #
# binaryanomaly - v0.2                                                         #
# https://github.com/binaryanomaly/bash_files                                  #
#                                                                              #
# Edited and customized by Robert 'Bobby' Zenz                                 #
# https://github.com/RobertZenz/BobbysBashDir                                  #
################################################################################


__print_ascii_art() {
    printf "%s\n" "$1" | toilet -w $COLUMNS
}

__print_ascii_art_lolcat() {
    { printf "%s\n" "$1" | toilet -w $COLUMNS ; __print_centered_string "$2" ; } | lolcat -S 550
}

__print_centered_line() {
	local length=$1
	
	if [ -z "$length" ]; then
		length=76
	fi
	
	local char="-"
	local line=""
	
	for counter in $(seq $length); do
		line=$line$char
	done
	
	__print_centered_string $line
}

__print_centered_string() {
    local c_string="$1"
    local mid=$(((${#c_string}+$COLUMNS)/2))
    local leftspace=$((${mid}-${#c_string}))

    printf "%-*s%s\n" $leftspace " " "$c_string"
}


# Args: stringvar, offset
__print_centered_multiline() {
    # Find longest string
    local strlen=0
    local offset=$2
    
    if [ -z "$offset" ]; then
    	offset=0
    fi
    
    while IFS= read -r line
    do
        # Store length
        if [ ${#line} -gt $strlen ]; then
            strlen="${#line}"
        fi
    done <<< "$1"

    # Apply offset
    strlen=$(($strlen-$offset))

    # Print each line with offset of longest string
    while IFS= read -r line
    do
        __print_fixed_singleline "$line" $strlen
    done <<< "$1"

    strlen=0
}


__print_fixed_singleline() {
    local c_string="$1"
    local mid=$(((strlen+$COLUMNS)/2))
    local leftspace=$((${mid}-strlen))
    
    printf "%-*s%s\n" $leftspace " " "$c_string"
}

