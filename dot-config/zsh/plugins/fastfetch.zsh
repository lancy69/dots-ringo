if (( ! $+commands[fastfetch] )); then
	warn "fastfetch: command not exist, skipping plugin..."
	return 0
fi

alias ff="fastfetch"
