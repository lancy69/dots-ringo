if (( ! $+commands[agent-desktop] )); then
	warn "agent-desktop: command not exist, skipping plugin..."
	return 0
fi

export AGENT_DESKTOP_HOME="$XDG_DATA_HOME/agent-desktop"
