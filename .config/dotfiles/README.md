
# Niri Dotfiles

Personal Linux desktop configuration.

## Components

* Niri
* Neovim (NvChad)
* Kitty
* Zsh + Powerlevel10k
* Fish
* Fastfetch
* Cava
* Spicetify
* Zathura
* Zed
* Swaylock

## Screenshots

(Add screenshots here)

## Installation

Clone the bare repository:

```bash
git clone --bare https://github.com/gottatouchsomegrass/niri-dotfiles.git $HOME/.dotfiles
```

Add the alias:

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Checkout the files:

```bash
dotfiles checkout
```

Hide untracked files:

```bash
dotfiles config --local status.showUntrackedFiles no
```

## Notes

Some software may need to be installed separately:

* Niri
* Neovim
* Kitty
* Fastfetch
* Cava
* Zathura
* Zed
* Spicetify
