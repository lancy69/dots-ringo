if ! (( $+commands[lazygit] )); then
	print -P "%B%F{yellow}[WARNING] lazygit: binary not exist, skipping plugin...%f%b"
	return 0
fi

alias g="lazygit"
