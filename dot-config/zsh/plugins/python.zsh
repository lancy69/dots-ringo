if (( ! $+commands[python3] )); then
	warn "python3: command not exist, skipping plugin..."
	return 0
fi

[[ -d "$XDG_STATE_HOME/python" ]] || mkdir -p "$XDG_STATE_HOME/python"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"

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
