#!/bin/bash

theme_files=()
theme_files+=("catppuccin.kdl")
theme_files+=("cyberpunk.kdl")
theme_files+=(dracula.kdl)
theme_files+=(everforest-dark.kdl)
theme_files+=(everforest-light.kdl)
theme_files+=(gruvbox.kdl)
theme_files+=(kanagawa.kdl)
theme_files+=(menace.kdl)
theme_files+=(molokai-dark.kdl)
theme_files+=(nightfox.kdl)
theme_files+=(nord.kdl)
theme_files+=(one-half-dark.kdl)
theme_files+=(pencil.kdl)
theme_files+=(solarized-dark.kdl)
theme_files+=(solarized-light.kdl)
theme_files+=(tokyo-night-dark.kdl)
theme_files+=(tokyo-night-light.kdl)
theme_files+=(tokyo-night-storm.kdl)
theme_files+=(tokyo-night.kdl)

for theme_file in "${theme_files[@]}"; do
    wget "https://raw.githubusercontent.com/zellij-org/zellij/main/zellij-utils/assets/themes/${theme_file}" -O ./"${theme_file}"
done
