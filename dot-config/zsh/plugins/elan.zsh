if (( ! $+commands[elan] )); then
	warn "elan: command not exist, skipping plugin..."
	return 0
fi

export ELAN_HOME="$XDG_DATA_HOME/elan"
