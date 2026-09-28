if (( ! $+commands[lazygit] )); then
	warn "lazygit: command not exist, skipping plugin..."
	return 0
fi

alias g="lazygit"
