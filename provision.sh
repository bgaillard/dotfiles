#!/bin/bash

# Install Ansible
#
# @see https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#ensuring-pip-is-available
python3 -m pip install --user ansible

# Run Ansible playbook
ansible-playbook \
    --inventory ansible/hosts.yml \
    ansible/site.yml
