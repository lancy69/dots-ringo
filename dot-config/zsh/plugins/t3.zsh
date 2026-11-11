if (( ! $+commands[t3] )); then
	warn "t3: command not exist, skipping plugin..."
	return 0
fi

export T3CODE_HOME="$XDG_DATA_HOME/t3"
