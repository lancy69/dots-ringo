if (( ! $+commands[dsh] )); then
	warn "dsh: command not exist, skipping plugin..."
	return 0
fi

export DSH_HOME="$XDG_DATA_HOME/dsh"
