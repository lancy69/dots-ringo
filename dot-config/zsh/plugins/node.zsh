if (( ! $+commands[node] )); then
	print -P "%B%F{yellow}[WARNING] node: binary not exist, skipping plugin...%f%b"
	return 0
fi

[[ -d "$XDG_STATE_HOME/node" ]] || mkdir -p "$XDG_STATE_HOME/node"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/history"

[[ -d "$XDG_STATE_HOME/npm" ]] || mkdir -p "$XDG_STATE_HOME/npm"
export NPM_CONFIG_CACHE="${NPM_CONFIG_CACHE:-$XDG_CACHE_HOME/npm}"
export NPM_CONFIG_INIT_MODULE="${NPM_CONFIG_INIT_MODULE:-$XDG_CONFIG_HOME/npm/config/npm-init.js}"
export NPM_CONFIG_LOGS_DIR="${NPM_CONFIG_LOGS_DIR:-$XDG_STATE_HOME/npm/logs}"
export NPM_CONFIG_PREFIX="${NPM_CONFIG_PREFIX:-$XDG_DATA_HOME/npm}"
export NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG:-$XDG_CONFIG_HOME/npm/npmrc}"

prepend_path "$NPM_CONFIG_PREFIX/bin"
