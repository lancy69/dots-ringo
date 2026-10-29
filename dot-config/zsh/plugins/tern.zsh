# Tern
# A powerful terminal by Stencil, omp's natural habitat.
# https://stencil.so/tern

if (( ! $+commands[tern] )); then
	warn "tern: command not exist, skipping plugin..."
	return 0
fi

export TERN_CONFIG_DIR="$XDG_DATA_HOME/tern"
# Explicitly set $TERN_CONFIG_DIR for desktop app to use the right file.
if [[ "$(launchctl getenv "TERN_CONFIG_DIR" 2> /dev/null)" != "$CODEX_HOME" ]]; then
  launchctl setenv "TERN_CONFIG_DIR" "$TERN_CONFIG_DIR"
fi
