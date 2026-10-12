# Fast Node Manager
# A fast and simple Node.js version manager, built in Rust.
# https://github.com/schniz/fnm

if (( ! $+commands[fnm] )); then
	warn "fnm: command not exist, skipping plugin..."
	return 0
fi

eval "$(fnm env --use-on-cd --shell zsh)"
