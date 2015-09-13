function uptimeSummarizer() {
	# Magically parse the uptime string into numbers (the wrong way, for sure! We'll see!)
	uptime_days=$(uptime | sed 's/ [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\} up \([0-9]\+\?\) days.*/\1/')
	uptime_hours=$(uptime | sed 's/ [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\} up [0-9]\+\? days, *\?\(\([0-9]\{1,2\}\):\|[0-9]\{1,2\} min\).*/\2/')
	if [[ "$uptime_hours" == '' ]]; then
		uptime_hours=0
	fi
	uptime_minutes=$(uptime | sed 's/ [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\} up [0-9]\+\? days, *\?\([0-9]\{1,2\}:\([0-9]\{2\}\)\|\([0-9]\{1,2\}\) min\).*/\2\3/')
	
	# Output
	echo "Host up for \033[34m${uptime_days}d\033[0m, \033[34m${uptime_hours}h\033[0m, \033[34m${uptime_minutes}min\033[0m"
}

registerSummarizer "Uptime" uptimeSummarizer
