if ! (( $+commands[nvim] )); then
	print -P "%B%F{yellow}[WARNING] nvim: binary not exist, skipping plugin...%f%b"
	return 0
fi

# Set default editor in terminal.
export EDITOR="nvim"
export VISUAL="nvim"
# Set default man pager.
export MANPAGER="nvim +Man!"
