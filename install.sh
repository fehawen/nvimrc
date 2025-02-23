#!/bin/sh

#
# install.sh
#

DEST="$HOME/.config/nvim"
BACKUP="$DEST.backup.$(date +%s)"

if [ -d "$DEST" ] && [ ! -h "$DEST" ]; then
    printf 'Creating backup: %s\n' "$BACKUP"
    mv "$DEST" "$BACKUP"
fi

printf 'Symlinking config: %s -> %s\n' "$PWD/nvim" "$DEST"
ln -sf "$PWD/nvim" "$DEST"
