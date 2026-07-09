# dots-ringo

My MacOS configurations.

## Installation

The installation of Ringo requires *Command Line Tools for Xcode* to be installed. Install CLT with the following command.

```zsh
xcode-select --install
```

### One-Liner

Install ringo, within one command.

```zsh
curl -fsSL "https://gitee.com/lancy69/dots-ringo/raw/main/install.zsh" | zsh
```

NOTE: to avoid writing too much branch conditions, this script uses Chinese mirrors by default.

### Manual Installation

1. Clone this repo.

```zsh
git clone https://github.com/lancy69/dots-ringo.git ~/.dots-ringo && cd ~/.dots-ringo
```

Users in China may clone from the Chinese mirror instead.

```zsh
git clone https://gitee.com/lancy69/dots-ringo.git ~/.dots-ringo && cd ~/.dots-ringo
```

2. Source the Zsh script.

```zsh
source dot-zshrc
```

It shall install and set up [Homebrew](https://brew.sh) package manager.

3. Install GNU stow.

```zsh
brew install stow
```

4. Link configs with `stow`.

```zsh
stow . --dotfiles
```

5. Install all packages with `brew`.

```zsh
brew bundle
```
