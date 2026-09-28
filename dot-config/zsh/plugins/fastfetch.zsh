if (( ! $+commands[fastfetch] )); then
	[[ ${RINGO_SUPPRESS_WARNING:-} == true ]] || print -P "%B%F{yellow}[WARNING] fastfetch: binary not exist, skipping plugin...%f%b"
	return 0
fi

alias ff="fastfetch"
