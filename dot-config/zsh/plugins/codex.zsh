if (( ! $+commands[codex] )) && ! brew list chatgpt &>/dev/null; then
	print -P "%B%F{yellow}[WARNING] codex: binary not exist, skipping plugin...%f%b"
	return 0
fi

export CODEX_HOME="$XDG_DATA_HOME/codex"
