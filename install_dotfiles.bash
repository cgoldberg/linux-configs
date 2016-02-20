#!/usr/bin/env bash

BIN="$HOME/bin"
DIR="$(realpath .)"

if [ ! -d "$BIN" ]; then
    echo "creating directory: $BIN ..."
    mkdir "$BIN"
fi

FILES=(
    ".bashrc"
    ".bash_aliases"
    ".gitconfig"
    "bin/backup_world.sh"
)
for FILE in "${FILES[@]}"; do
    if [ -f "$HOME/$FILE" ]; then
        echo "backing up $HOME/$FILE to $HOME/$FILE.old ..."
        cp "$HOME/$FILE" "$HOME/$FILE.old"
    fi
    echo "copying $DIR/$FILE to $HOME/$FILE ..."
    cp "$DIR/$FILE" "$HOME/$FILE"
done
