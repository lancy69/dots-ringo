if ! (( $+commands[docker] )); then
	print -P "%B%F{yellow}[WARNING] docker: binary not exist, skipping plugin...%f%b"
	return 0
fi

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
