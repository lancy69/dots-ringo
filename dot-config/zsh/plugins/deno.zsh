if (( ! $+commands[deno] )); then
	warn "deno: command not exist, skipping plugin..."
	return 0
fi

export DENO_INSTALL_ROOT="$XDG_DATA_HOME/deno"

prepend_path "$DENO_INSTALL_ROOT/bin"
