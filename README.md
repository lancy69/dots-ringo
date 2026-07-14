# Ringo

![](thumbnail.png)

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

> [!NOTE]
> to avoid writing too much branch conditions, this script uses Chinese mirrors by default.

### Manual Installation

1. Clone this repo.

2. Install homebrew.

3. Install GNU Stow.

4. Link configs with `stow`.

5. Install all packages with `brew bundle --file ~/.brewrc`.
