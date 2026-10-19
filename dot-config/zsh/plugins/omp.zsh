if (( ! $+commands[omp] )); then
	warn "omp: command not exist, skipping plugin..."
	return 0
fi

omp() {
	local -x PI_CODING_AGENT_DIR="$XDG_DATA_HOME/omp/agent"
	local -x PI_CONFIG_DIR="$XDG_DATA_HOME/omp"
	command omp "$@"
}
