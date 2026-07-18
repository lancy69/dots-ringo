if (( ! $+commands[rustup] )); then
	print -P "%B%F{yellow}[WARNING] rustup: binary not exist, skipping plugin...%f%b"
	return 0
fi

export CARGO_HOME="${CARGO_HOME:-$XDG_DATA_HOME/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$XDG_DATA_HOME/rustup}"

prepend_path "$HOMEBREW_PREFIX/opt/rustup/bin"
prepend_path "$CARGO_HOME/bin"
