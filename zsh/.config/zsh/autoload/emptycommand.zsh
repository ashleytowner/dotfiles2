# This plugin will use zsh lifecycle hooks to
# clear the terminal if you enter a blank command

# Run clear after a command has been run but before it has been executed.

preexec() {
	# Make the last run command accessible via a variable
	cmd=$1
}

precmd() {
	# The maximum gap allowed between two empty commands
	# before the $EMPTY_COMMAND will be run
	if [ ! "$EMPTY_COMMAND_DELTA" ]; then
		((EMPTY_COMMAND_DELTA=2**16))
	fi

	# If the command was emtpy
	if [ ! "$cmd" ]; then

		# Set the last run if it isn't set. This should only happen the first
		# time an empty command is run
		if [ ! "$lastrun" ]; then
			# Subtract the empty command delta so that it won't run the first time
			# en empty command is entered
			current_time=$(date +%s%3N)
			lastrun=$(($current_time - $EMPTY_COMMAND_DELTA))
			unset current_time
		fi

		# Get the difference between now and the last run
		timedelta=$(($(date +%s%3N) - $lastrun))	

		# If the time between two empty commands being entered is less than the
		# max allowed time delta, run the $EMPTY_COMMAND.
		if [[ $timedelta -le $EMPTY_COMMAND_DELTA ]]; then
			eval $EMPTY_COMMAND
		fi

		# Set the last run to now, and clean up
		lastrun=$(date +%s%3N)
		unset timedelta
	fi

	cmd=''
	return 0;
}

