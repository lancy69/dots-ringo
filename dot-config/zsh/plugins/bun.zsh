if (( ! $+commands[bun] )); then
	warn "bun: command not exist, skipping plugin..."
	return 0
fi

export BUN_INSTALL_BIN="$XDG_DATA_HOME/bun/bin"
export BUN_INSTALL_CACHE_DIR="$XDG_CACHE_HOME/bun"
export BUN_INSTALL_GLOBAL_DIR="$XDG_DATA_HOME/bun"

prepend_path "$BUN_INSTALL_BIN"
