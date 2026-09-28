if (( ! $+commands[sheldon] )); then
	[[ ${RINGO_SUPPRESS_WARNING:-} == true ]] || print -P "%B%F{yellow}[WARNING] sheldon: binary not exist, skipping plugin...%f%b"
	return 0
fi

eval "$(sheldon source)"
