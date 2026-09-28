if (( ! $+commands[starship] )); then
	warn "starship: command not exist, skipping plugin..."
	return 0
fi

export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

eval "$(starship init zsh)"
