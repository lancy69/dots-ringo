#!/bin/zsh

setopt ERR_EXIT
setopt NO_UNSET
setopt PIPE_FAIL

# Print welcoming banner. ASCII art is stolen from fastfetch.
print -P "$(cat <<EOF
%B\
%F{2}                        ..'
%F{2}                    ,xNMM.
%F{2}                  .OMMMMo
%F{2}                  lMM"
%F{2}        .;loddo:.  .olloddol;.        %F{2}╦═╗%F{3}─┬─%F{1}┌┐┌%F{5}┌─┐%F{4}┌─┐
%F{2}      cKMMMMMMMMMMNWMMMMMMMMMM0:      %F{2}╠╦╝%F{3} │ %F{1}│││%F{5}│ ┬%F{4}│ │
%F{3}    .KMMMMMMMMMMMMMMMMMMMMMMMWd.      %F{2}╩╚═%F{3}─┴─%F{1}┘└┘%F{5}└─┘%F{4}└─┘
%F{3}    XMMMMMMMMMMMMMMMMMMMMMMMX.
%F{1}   ;MMMMMMMMMMMMMMMMMMMMMMMM:         %fAn opinionated,
%F{1}   :MMMMMMMMMMMMMMMMMMMMMMMM:         %feye-catching, terminal-first,
%F{1}   .MMMMMMMMMMMMMMMMMMMMMMMMX.        %fpseudo-declarative-by-bootstrapping-everything,
%F{1}    kMMMMMMMMMMMMMMMMMMMMMMMMWd.      %fspend-too-much-time-tweaking-to-actually-get-to-work,
%F{5}    'XMMMMMMMMMMMMMMMMMMMMMMMMMMk     %fMacOS configuration.
%F{5}     'XMMMMMMMMMMMMMMMMMMMMMMMMK.
%F{4}       kMMMMMMMMMMMMMMMMMMMMMMd
%F{4}        ;KMMMMMMMWXXWMMMMMMMk.
%F{4}          "cooc*"    "*coo'"%f%b
EOF
)
"

# Runs only on Zsh, MacOS, Apple Silicon.
if [[ "$OSTYPE" != darwin* ]] || [[ $(sysctl -n "hw.optional.arm64" &>/dev/null) != 1 ]]; then
	print -P "%B%F{1}[ERROR] Ringo is for MacOS only. Exiting...%f%b"
	exit 1
esac

ringo_dir="${RINGO_DIR:-$HOME/.dots-ringo}"
git clone "https://gitee.com/lancy69/dots-ringo.git" "$ringo_dir"
cd "$ringo_dir"
source "dot-zshrc"

# Ensure we have homebrew installed.
if ! (( $+commands[brew] )); then
	print -P "%B%F{3}[WARNING] Cannot find brew, installing...%f%b"

	brew_dir="$(mktemp -d)"
	git clone --depth=1 "https://mirror.nju.edu.cn/git/homebrew/install.git" "$brew_dir"
	bash "$brew_dir/install.sh"
	rm -rf "$brew_dir"

	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install "stow"
stow .
brew bundle

print -P "%B%F{2}[INFO] Congrats! Ringo is installed successfully.%f%b" >&2
print -P "%B%F{2}[INFO] Some changes may only take effect in new shell instances.%f%b" >&2
