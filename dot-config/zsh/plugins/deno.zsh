if (( ! $+commands[deno] )); then
	print -P "%B%F{yellow}[WARNING] deno: binary not exist, skipping plugin...%f%b"
	return 0
fi

export DENO_INSTALL_ROOT="$XDG_DATA_HOME/deno"

prepend_path "$DENO_INSTALL_ROOT/bin"
