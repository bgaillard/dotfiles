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
apt install ansible curl git gh gpg python3-debian -y
adduser baptiste sudo

# TODO: Install the Bitwarden CLI

# Install required Ansible roles
ansible-galaxy collection install community.general
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

# TODO: Install the Bitwarden CLI

# Install required Ansible roles
ansible-galaxy collection install community.general
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


## Testing

### incus

```bash
# Launch a Debian trixie container
incus launch images:debian/trixie chezmoi-test

# Provision
incus exec chezmoi-test -- bash

    # Install base packages
    #
    # If you encounter networking issues check the bellow links
    #
    # @see https://linuxcontainers.org/incus/docs/main/howto/network_bridge_firewalld/#network-incus-docker
    # @see https://discuss.linuxcontainers.org/t/incus-container-unable-to-reach-outside-world/21256/11
    apt install ansible curl git gh gpg python3-debian -y
    ansible-galaxy collection install prometheus.prometheus

    # Create a standard user
    useradd -m -s /bin/bash baptiste
    adduser baptiste sudo
    passwd baptiste

    # Install and initialize chezmoi
    su baptiste
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
     ~/.local/bin/chezmoi init bgaillard

    # Get a Github token to prevent Rate Limit problems with 'mise'
    BROWSER=false gh auth login
    export MISE_GITHUB_TOKEN=$(gh auth token)

    # Copy the provisioning configuration file and adapt it to your needs
    cd ~/.local/share/chezmoi
    cp p.yml ~/.config

    # Start the provisioning
    ./p
```
