if (( ! $+commands[pi] )); then
	[[ ${RINGO_SUPPRESS_WARNING:-} == true ]] || print -P "%B%F{yellow}[WARNING] pi: binary not exist, skipping plugin...%f%b"
	return 0
fi

export PI_CODING_AGENT_DIR="$XDG_DATA_HOME/pi"
