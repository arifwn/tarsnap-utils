#!/bin/sh

CURRENT_DIR=`pwd`
ACCOUNT_KEY="$CURRENT_DIR/account.key"
CACHE_DIR="$CURRENT_DIR/cache"

command -v tarsnap >/dev/null 2>&1 || { echo >&2 "Tarsnap is not installed. Aborting."; exit 1; }

echo "Retrieving archives list..."

exec tarsnap --list-archives --keyfile $ACCOUNT_KEY --cachedir $CACHE_DIR | sort > archives.txt

echo "Done! Now check archives.txt to see the list of available archives"