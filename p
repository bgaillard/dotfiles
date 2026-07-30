#!/bin/bash

export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Ensure mise is installed
if ! command -v mise &> /dev/null; then
    echo "mise is not installed!"
    echo "Please install mise first with 'curl https://mise.run | sh'"
    exit 1
fi

# Bootstrap and update mise
mise bootstrap
mise up

# Ensure the 'p.yml' configuration file exists
if [ ! -d ~/.config ]; then
  mkdir -p ~/.config
fi
if [ ! -f ~/.config/p.yml ]; then
  echo "The configuration file ~/.config/p.yml does not exist!"
  echo "Copy it with 'cp ~/.local/share/chezmoi/p.yml ~/.config' and edit it to your needs."
  exit 1
fi

# Run Ansible playbook
ansible-playbook \
    --ask-become-pass \
    --inventory ansible/hosts.yml \
    ansible/site.yml --extra-vars "@~/.config/p.yml"
