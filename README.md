# dotfiles

Dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi).

**WARNING**: The full install requires at least 40 GB.


## Init

```bash
# Install base packages (Debian)
#
# After 'adduser' logout and login again to apply sudo group
su -
apt install ansible curl git gh sudo -y
adduser baptiste sudo

# Install required Ansible roles
ansible-galaxy collection install prometheus.prometheus

# Install ~/.local/bin/chezmoi
#
# After installation, logout and login again to apply ~/.local/bin to PATH
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# Initialize ~/.local/share/chezmoi
~/.local/bin/chezmoi init bgaillard
```


## Provision

```bash
# Get a Github token to prevent Rate Limit problems with 'mise'
#
# @see https://mise.jdx.dev/troubleshooting.html#_403-forbidden-when-installing-a-tool
# @see https://stackoverflow.com/questions/78890002/how-to-do-gh-auth-login-when-run-in-headless-mode#answer-78890003
BROWSER=false gh auth login
export MISE_GITHUB_TOKEN=$(gh auth token)

# Copy the provisioning configuration file and adapt it to your needs
cd ~/.local/share/chezmoi
cp p.yml ~/.config

# Start the provisioning
./p
```


## Copy dotfiles

```bash
# Apply dotfiles to home directory
chezmoi diff
chezmoi apply
```
