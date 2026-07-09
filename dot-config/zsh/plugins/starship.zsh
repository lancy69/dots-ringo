if ! (( $+commands[starship] )); then
	print -P "%B%F{yellow}[WARNING] starship: binary not exist, skipping plugin...%f%b"
	return 0
fi

export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

eval "$(starship init zsh)"
