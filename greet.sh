#!/usr/bin/env bash

# Robert 'Bobby' Zenz
# https://github.com/RobertZenz/BobbysBashDir
# Licensed as Public Domain or Creative Commons Zero


__df_short_uuid() {
	df --human-readable --exclude-type=tmpfs --exclude-type=devtmpfs --exclude-type=ecryptfs -T | \
		tail --lines=+2 | \
		sed -r "s/by-uuid\/([a-z0-9]+)\-([a-z0-9]+)\-([a-z0-9]+)\-([a-z0-9]+)\-([a-z0-9]+)/by-uuid\/...-\5/g" | \
		sed -r "s/ {22}/            /g"
}

__greet() {
	local hostname=$(hostname)
	local kernelinfo=$(uname --kernel-name --kernel-release --hardware-platform --operating-system)
	local date="$(date "+%a, %b %_d %Y · %I:%M:%S %p %z (%Z) · %s")"
	local mounts="$(__df_short_uuid)"
	local osinfo="$(lsb_release -ds) $(lsb_release -cs)"
	local uptime="$(uptime)"
	local users="$(who --users)"
	local lastlogins="$(last -3 | head -3)"
	
	/bin/echo -e "$__hostcolor"
	 __print_centered_multiline "$(toilet --font "$__hostfont" $hostname)"
	/bin/echo -e "$__treset"
	
	__print_centered_string "$date"
	__print_centered_line
	__print_centered_string "$osinfo · $kernelinfo"
	__print_centered_string "$uptime"
	__print_centered_line
	__print_centered_multiline "$mounts"
	__print_centered_line
	__print_centered_multiline "$users"
	__print_centered_line
	__print_centered_multiline "$lastlogins"
}

