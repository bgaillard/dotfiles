# dotfiles

Repository used to provision and configure my development machine, this is done executing the following workflow.

1. Install tools with [mise](https://mise.jdx.dev/) and [ansible](https://docs.ansible.com/projects/ansible/latest/index.html)
2. Install dotfiles with [chezmoi](https://github.com/twpayne/chezmoi)

:warning: The full install requires at least 40 GB.

## Usage

I use [Debian](https://www.debian.org), those instructions are not guaranteed to work in other distributions (adapt the code depending on your needs).

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

# Copy the provisioning configuration files
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
