if (( ! $+commands[codex] )) && [[ ! -d "/Applications/ChatGPT.app" ]]; then
	print -P "%B%F{yellow}[WARNING] codex: binary not exist, skipping plugin...%f%b"
	return 0
fi

export CODEX_HOME="$XDG_DATA_HOME/codex"
# Explicitly set $CODEX_HOME for desktop app to prevent cluttering $HOME.
if [[ "$(launchctl getenv "CODEX_HOME" 2> /dev/null)" != "$CODEX_HOME" ]]; then
  launchctl setenv "CODEX_HOME" "$CODEX_HOME"
fi
