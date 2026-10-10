if (( ! $+commands[opencode] )); then
	warn "opencode: command not exist, skipping plugin..."
	return 0
fi

alias oc="opencode"

# Using $XDG_DATA_HOME because OpenCode put config and data into the same dir.
export OPENCODE_CONFIG_DIR="$XDG_DATA_HOME/opencode"
