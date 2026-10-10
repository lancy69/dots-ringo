if (( ! $+commands[reasonix] )); then
	warn "reasonix: command not exist, skipping plugin..."
	return 0
fi

# NOTE: Run `reasonix setup` before first use.
export REASONIX_HOME="$XDG_DATA_HOME/reasonix"
export REASONIX_CACHE_HOME="$XDG_CACHE_HOME/reasonix"
export REASONIX_STATE_HOME="$XDG_STATE_HOME/reasonix"
