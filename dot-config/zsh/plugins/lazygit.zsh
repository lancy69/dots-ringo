if (( ! $+commands[lazygit] )); then
	[[ ${RINGO_SUPPRESS_WARNING:-} == true ]] || print -P "%B%F{yellow}[WARNING] lazygit: binary not exist, skipping plugin...%f%b"
	return 0
fi

alias g="lazygit"
