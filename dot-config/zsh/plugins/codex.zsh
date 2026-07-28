if (( ! $+commands[codex] )) && [[ ! -d "/Applications/ChatGPT.app" ]]; then
	print -P "%B%F{yellow}[WARNING] codex: binary not exist, skipping plugin...%f%b"
	return 0
fi

export CODEX_HOME="$XDG_DATA_HOME/codex"
