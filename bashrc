#!/usr/bin/env bash

# Robert 'Bobby' Zenz
# https://github.com/RobertZenz/BobbysBashDir
# Licensed as Public Domain or Creative Commons Zero


# Make sure that files are only writeable by us, readonly for others
# in our group and everyone else can't touch them.
umask 0027


# Early bailout in case we're not interactive.
[ -z "$PS1" ] && return


# Include the global bash completion file if it is available.
if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Set up the history.
HISTCONTROL=ignoredups:ignorespace:erasedups
HISTSIZE=1000
HISTFILESIZE=2000


# Make sure that history is saved and loaded at every command. This is needed
# to have a good working history acroos mulitple bash sessions.
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


export PAGER=most


# source all we need.
source ~/.bash/includes.sh

source ~/.bash/aliases.sh
source ~/.bash/config.sh
source ~/.bash/greet.sh
source ~/.bash/prompt.sh


PS1='$(__prompt "\w" "$?")'


__greet

