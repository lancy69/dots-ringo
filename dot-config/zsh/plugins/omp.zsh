if (( ! $+commands[omp] )); then
	[[ ${RINGO_SUPPRESS_WARNING:-} == true ]] || print -P "%B%F{yellow}[WARNING] omp: binary not exist, skipping plugin...%f%b"
	return 0
fi

omp() {
	env PI_CODING_AGENT_DIR="$XDG_DATA_HOME/omp" omp "$@"
}
