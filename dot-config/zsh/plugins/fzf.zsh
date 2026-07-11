if ! (( $+commands[fzf] )); then
	print -P "%B%F{yellow}[WARNING] fzf: binary not exist, skipping plugin...%f%b"
	return 0
fi

source <(fzf --zsh)

# Tokyo Night Storm
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2e3c64 \
  --color=bg:#1f2335 \
  --color=border:#29a4bd \
  --color=fg:#c0caf5 \
  --color=gutter:#1f2335 \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#29a4bd \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

if (( $+commands[fd] )); then
	export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --type file"
	export FZF_CTRL_T_COMMAND="fd --follow --hidden --strip-cwd-prefix --type file"
fi
