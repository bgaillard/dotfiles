#!/bin/bash

OPTS=$(getopt -o agmpv --long audio,gui,mail,print,video -n 'p' -- "$@")

if [ $? -ne 0 ]; then
  echo "Failed to parse options" >&2
  exit 1
fi

## Reset the positional parameters to the parsed options
eval set -- "$OPTS"

AUDIO="false"
GUI="false"
MAIL="false"
PRINT="false"
VIDEO="false"

while true; do
  case "$1" in
    -a | --audio ) AUDIO="true"; shift ;;
    -g | --gui ) GUI="true"; shift ;;
    -m | --mail ) MAIL="true"; shift ;;
    -p | --print ) PRINT="true"; shift ;;
    -v | --video ) VIDEO="true"; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

# Run Ansible playbook
ansible-playbook \
    --ask-become-pass \
    --inventory ansible/hosts.yml \
    ansible/site.yml --extra-vars '{"gui":'"$GUI"',"audio":'"$AUDIO"', "mail":'"$MAIL"', "print":'"$PRINT"', "video":'"$VIDEO"'}'
