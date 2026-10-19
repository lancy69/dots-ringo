if (( ! $+commands[gpg] )); then
	warn "gpg: command not exist, skipping plugin..."
	return 0
fi

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
