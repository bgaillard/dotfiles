# dotfiles

Provisioning and configuration is done executing the following workflow.

1. Install tools with [mise](https://mise.jdx.dev/) and [ansible](https://docs.ansible.com/projects/ansible/latest/index.html)
2. Install dotfiles with [chezmoi](https://github.com/twpayne/chezmoi)

**WARNING**: The full install requires at least 40 GB.

## Usage

My operating system is Debian, those instructions are not guaranteed to work in other distributions.

```bash
# Create a standard user
useradd -m -s /bin/bash baptiste
adduser baptiste sudo
passwd baptiste

# Install mise in '~/.local/bin'
su baptiste
cd ~
curl https://mise.run | sh
eval "$(~/.local/bin/mise activate bash)"
mise use --global bitwarden@latest gh@latest chezmoi@latest

# Get a Github token to prevent Rate Limit problems with 'mise'
sudo apt install git
BROWSER=false gh auth login
export MISE_GITHUB_TOKEN=$(gh auth token)

# Retrieve dotfiles
chezmoi init bgaillard

# Copy the provisioning configuration file and adapt it to your needs
mkdir -p ~/.config/mise/conf.d/
cd ~/.local/share/chezmoi
cp p.yml ~/.config
cp dot_config/private_mise/private_config.toml ~/.config/mise/config.toml
cp -R dot_config/private_mise/conf.d/* ~/.config/mise/conf.d/

# Login to Bitwarden
bw login
export BW_SESSION=...

# Start the provisioning
./p

# Apply dotfiles to home directory
chezmoi diff
chezmoi apply
```


## Testing with incus

Launch a Debian Trixie VM and start a bash into it.

```bash
incus launch -d root,size=40GiB images:debian/trixie chezmoi-test
incus exec chezmoi-test -- bash
```

Then simply execute the script mentioned in the usage section.

:bulb: If you encounter networking issues check the bellow links

- https://linuxcontainers.org/incus/docs/main/howto/network_bridge_firewalld/#network-incus-docker
- https://discuss.linuxcontainers.org/t/incus-container-unable-to-reach-outside-world/21256/11


## kDrive

FIXME: The install of kDrive should be done with Ansible, the update should be managed with the `u` alias command.

## Ente Auth

FIXME: The install of Ente auth should be done with Ansible, the update should be managed with the `u` alias command.

## Vivaldi

FIXME: The install of Vivaldi should be done with Ansible, the update should be managed with the `u` alias command.

### Update

Download kDrive from [Télecharger l'application kDrive pour Linux](https://www.infomaniak.com/fr/applications/telecharger-kdrive) into the `Downloads`.

Manually stop kDrive using the UI.

Execute the following commands to update kDrive:

```bash
rm ~/.local/bin/kDrive*
chmod +x ~/Downloads/kDrive-*.AppImage
mv ~/Downloads/kDrive-*.AppImage ~/.local/bin
ln -s ~/.local/bin/kDrive-3.7.10.1-amd64.AppImage ~/.local/bin/kDrive
```

Logout from XFCE and login again.

### XFCE Desktop file

Create a `~/.config/autostart/kDrive.desktop` file with the following content:

```ini
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=kDrive
Comment=Infonamiak kDrive
Exec=/home/baptiste/.local/bin/kDrive
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
```
