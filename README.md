# dotfiles

Dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi).

## Setup

**WARNING**: Requires at least 40 GB for the whole setup.

```bash
# Install base packages (Debian)
#
# After 'adduser' logout and login again to apply sudo group
su -
apt install ansible curl sudo
adduser baptiste sudo

# Install ~/.local/bin/chezmoi
#
# After installation, logout and login again to apply ~/.local/bin to PATH
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# Check chezmoi version
chezmoi --version

# Initialize ~/.local/share/chezmoi
chezmoi init bgaillard

# Apply dotfiles to home directory
chezmoi diff
chezmoi apply
```

## Provisioning

```bash
# Without GUI packages
./p

# With GUI packages
./p --gui
```
