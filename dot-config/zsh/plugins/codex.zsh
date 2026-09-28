if (( ! $+commands[codex] )); then
	warn "codex: command not exist, skipping plugin..."
	return 0
fi

export CODEX_HOME="$XDG_DATA_HOME/codex"
