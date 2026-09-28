if (( ! $+commands[sheldon] )); then
	warn "sheldon: command not exist, skipping plugin..."
	return 0
fi

eval "$(sheldon source)"
