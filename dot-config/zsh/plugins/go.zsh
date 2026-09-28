if (( ! $+commands[go] )); then
	warn "go: command not exist, skipping plugin..."
	return 0
fi

export GOMODCACHE="${GOMODCACHE:-$XDG_CACHE_HOME/go/mod}"
export GOPATH="${GOPATH:-$XDG_DATA_HOME/go}"

prepend_path "$GOPATH/bin"
