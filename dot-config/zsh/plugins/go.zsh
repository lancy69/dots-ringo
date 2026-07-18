if (( ! $+commands[go] )); then
	print -P "%B%F{yellow}[WARNING] go: binary not exist, skipping plugin...%f%b"
	return 0
fi

export GOMODCACHE="${GOMODCACHE:-$XDG_CACHE_HOME/go/mod}"
export GOPATH="${GOPATH:-$XDG_DATA_HOME/go}"

prepend_path "$GOPATH/bin"
