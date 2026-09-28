if (( ! $+commands[omp] )); then
	warn "omp: command not exist, skipping plugin..."
	return 0
fi

omp() {
	env PI_CODING_AGENT_DIR="$XDG_DATA_HOME/omp" omp "$@"
}
