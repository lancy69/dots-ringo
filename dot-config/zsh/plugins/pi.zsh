if (( ! $+commands[pi] )); then
	warn "pi: command not exist, skipping plugin..."
	return 0
fi

export PI_CODING_AGENT_DIR="$XDG_DATA_HOME/pi"
