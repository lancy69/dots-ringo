if ! (( $+commands[eza] )); then
	print -P "%B%F{yellow}[WARNING] eza: binary not exist, skipping plugin...%f%b"
	return 0
fi

alias e="eza --group-directories-first --icons=auto"
