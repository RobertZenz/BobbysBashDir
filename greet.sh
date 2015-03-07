#!/bin/bash

__greet() {
	local hostname=$(hostname)
	local kernelinfo=$(uname --kernel-name --kernel-release --hardware-platform --operating-system)
	local date=$(date "+%Y-%m-%d %I:%M:%S %p")
	local osinfo="$(lsb_release -ds) $(lsb_release -cs)"
	local uptime=$(uptime)
	local users="$(who --users)"
	
	/bin/echo -e "$__hostcolor"
	 __print_centered_multiline "$(toilet --font "pagga" $hostname)"
	/bin/echo -e "$__reset"
	
	__print_centered_string "$date"
	__print_centered_string "$kernelinfo"
	__print_centered_string "$osinfo"
	__print_centered_string "$uptime"
	#__print_centered_string "$users"
}

