# dotfiles

Dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi).

**WARNING**: The full install requires at least 40 GB.

## Init

### Debian / Ubuntu

```bash
# Install base packages
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

### Red Hat

```bash
# Install base packages
#
# After 'adduser' logout and login again to apply sudo group
sudo yum install ansible-core git -y
sudo dnf install dnf5-plugins
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

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
