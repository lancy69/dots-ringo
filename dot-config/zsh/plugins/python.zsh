if (( ! $+commands[python3] )); then
	print -P "%B%F{yellow}[WARNING] python3: binary not exist, skipping plugin...%f%b"
	return 0
fi

# This is where Homebrew links `python` binary to latest version.
prepend_path "$HOMEBREW_PREFIX/opt/python/libexec/bin"

_auto_venv() {
	# Try to find a suitable venv.
	local dir="$PWD"
	while [[ -n "$dir" ]]; do
		local script="$dir/.venv/bin/activate"
		if [[ -f "$script" ]]; then
			source "$script"
			return
		fi
		dir="${dir%/*}" # traverse up
	done

	# No suitable venv found, deactivate any existing ones.
	[[ -z "$VIRTUAL_ENV" ]] || deactivate
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd _auto_venv
