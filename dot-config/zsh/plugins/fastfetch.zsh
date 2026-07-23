if ! (( $+commands[fastfetch] )); then
	print -P "%B%F{yellow}[WARNING] fastfetch: binary not exist, skipping plugin...%f%b"
	return 0
fi

alias f="fastfetch"
