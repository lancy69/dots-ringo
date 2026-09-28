if (( ! $+commands[nvim] )); then
	warn "nvim: command not exist, skipping plugin..."
	return 0
fi

# Set default editor in terminal.
export EDITOR="nvim"
export VISUAL="nvim"
# Set default man pager.
export MANPAGER="nvim +Man!"
