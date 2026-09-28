if (( ! $+commands[zoxide] )); then
	[[ ${RINGO_SUPPRESS_WARNING:-} == true ]] || print -P "%B%F{yellow}[WARNING] zoxide: binary not exist, skipping plugin...%f%b"
	return 0
fi

eval "$(zoxide init zsh)"
