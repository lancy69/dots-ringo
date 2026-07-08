# dots-ringo

My MacOS configurations.

## Installation

Perform following steps in a Zsh on a machine running MacOS.

1. Install *Command Line Tools for Xcode*.

```zsh
xcode-select --install
```

2. Clone this repo.

```zsh
git clone https://github.com/lancy69/dots-ringo.git ~/.dots-ringo && cd ~/.dots-ringo
```

Users in China may clone from the Chinese mirror instead.

```zsh
git clone https://gitee.com/lancy69/dots-ringo.git ~/.dots-ringo && cd ~/.dots.ringo
```

3. Source the Zsh script.

```zsh
source dot-zshrc
```

It shall install and set up [Homebrew](https://brew.sh) package manager.

4. Install GNU stow.

```zsh
brew install stow
```

5. Link configs with `stow`.

```zsh
stow . --dotfiles
```

6. Install all packages with `brew`.

```zsh
brew bundle
```

7. Reboot the machine (optional).
