if (( ! $+commands[docker] )); then
	warn "docker: command not exist, skipping plugin..."
	return 0
fi

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
