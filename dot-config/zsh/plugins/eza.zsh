if (( ! $+commands[eza] )); then
	[[ ${RINGO_SUPPRESS_WARNING:-} == true ]] || print -P "%B%F{yellow}[WARNING] eza: binary not exist, skipping plugin...%f%b"
	return 0
fi

alias e="eza --group-directories-first --icons=auto"
