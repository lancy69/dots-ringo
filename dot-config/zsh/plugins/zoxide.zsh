if (( ! $+commands[zoxide] )); then
	warn "zoxide: command not exist, skipping plugin..."
	return 0
fi

eval "$(zoxide init zsh)"
