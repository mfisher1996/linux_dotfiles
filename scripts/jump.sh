#!/usr/bin/bash
target=$1
if [ $# -eq 0  ]; then
    target=~
fi
cd $(find "$target/" -mindepth 1 -maxdepth 3 -type d | fzf)
clear
