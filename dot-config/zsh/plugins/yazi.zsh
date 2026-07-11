if ! (( $+commands[yazi] )); then
	print -P "%B%F{yellow}[WARNING] yazi: binary not exist, skipping plugin...%f%b"
	return 0
fi

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
