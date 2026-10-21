# direnv
# Unclutter your `.profile`.
# https://github.com/direnv/direnv

if (( ! $+commands[direnv] )); then
	warn "direnv: command not exist, skipping plugin..."
	return 0
fi

eval "$(direnv hook zsh)"
