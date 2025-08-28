# dotfiles

Dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi).

## Setup

```bash
# Install ~/.local/bin/chezmoi
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
# Install Ansible
#
# @see https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#ensuring-pip-is-available
python3 -m pip install --user ansible

# Provision
ansible-playbook ansible/site.yml
```
