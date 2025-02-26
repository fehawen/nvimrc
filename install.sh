#!/bin/sh

#
# install.sh
#

CONF="$HOME/.config"
DEST="$CONF/nvim"
BACKUP="$DEST.backup.$(date +%s)"

if [ ! -d "$CONF" ]; then
    printf 'Creating directory: %s\n' "$CONF"
    mkdir -p "$CONF"
fi

if [ -d "$DEST" ] && [ ! -h "$DEST" ]; then
    printf 'Creating backup: %s\n' "$BACKUP"
    mv "$DEST" "$BACKUP"
fi

printf 'Symlinking config: %s -> %s\n' "$PWD/nvim" "$DEST"
ln -sf "$PWD/nvim" "$DEST"
