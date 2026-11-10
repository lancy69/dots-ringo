# Pi
# There are many agent harnesses, but this one is yours.
# https://pi.dev

if (( ! $+commands[pi] )); then
	warn "pi: command not exist, skipping plugin..."
	return 0
fi

export PI_CODING_AGENT_DIR="$XDG_DATA_HOME/pi"
