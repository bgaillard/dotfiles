#!/bin/bash

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
