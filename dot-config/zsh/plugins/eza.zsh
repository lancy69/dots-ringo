if (( ! $+commands[eza] )); then
	warn "eza: command not exist, skipping plugin..."
	return 0
fi

alias e="eza --group-directories-first --icons=auto"
