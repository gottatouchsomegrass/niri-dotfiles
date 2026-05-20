# Niri Fedora DMS Dotfiles

Personal dotfiles for a Fedora + Niri Wayland setup.

## Included in this repo

- `.config/niri/config.kdl` — main Niri configuration
- `.zshrc` — Zsh config, aliases, prompt/plugins, shell tools
- `.zshenv` — environment variables and PATH setup
- `.local/share/applications/nvim-kitty.desktop` — desktop entry override

## Niri config highlights

- Input tuning (numlock, touchpad tap + natural scroll)
- Multi-monitor output definitions
- Layout with custom gaps, focus ring, shadows, and tab indicators
- Animation tuning for workspace/window transitions
- Window rules for common apps (wezterm, kitty, firefox, brave, etc.)
- Recent window switcher config (`Alt+Tab` behavior)

## Prerequisites

Install Niri and your preferred supporting tools on Fedora.

Optional tools referenced by shell config include:

- `zsh`, `oh-my-zsh`, `powerlevel10k`
- `lolcat`, `fzf`, `zoxide`, `atuin`, `lsd`
- `dnf5`, `flatpak`, and other aliases as needed

## Install

From your home directory:

```bash
# backup existing files first
mv ~/.config/niri/config.kdl ~/.config/niri/config.kdl.bak 2>/dev/null || true
mv ~/.zshrc ~/.zshrc.bak 2>/dev/null || true
mv ~/.zshenv ~/.zshenv.bak 2>/dev/null || true

# copy files
cp -r /path/to/niri-dotfiles/.config/niri ~/.config/
cp /path/to/niri-dotfiles/.zshrc ~/.zshrc
cp /path/to/niri-dotfiles/.zshenv ~/.zshenv
cp /path/to/niri-dotfiles/.local/share/applications/nvim-kitty.desktop ~/.local/share/applications/
```

Then reload:

```bash
# reload shell
exec zsh

# reload niri config (inside niri)
# use your configured keybind or restart the session
```

## Notes

- `config.kdl` includes external files under `dms/` (e.g. `dms/binds.kdl`, `dms/windowrules.kdl`, `dms/cursor.kdl`, `dms/outputs.kdl`).
- Ensure those include files exist in `~/.config/niri/dms/` if you use this exact config.

## License

Use freely and adapt to your own setup.
