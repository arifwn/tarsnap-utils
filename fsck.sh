#!/bin/sh

CURRENT_DIR=`pwd`
ACCOUNT_KEY="$CURRENT_DIR/account.key"
CACHE_DIR="$CURRENT_DIR/cache"

command -v tarsnap >/dev/null 2>&1 || { echo >&2 "Tarsnap is not installed. Aborting."; exit 1; }

echo "Running fsck..."

exec tarsnap --fsck --keyfile $ACCOUNT_KEY --cachedir $CACHE_DIR

echo "Done! Now run ./list-archives.sh to refresh archives.txt"