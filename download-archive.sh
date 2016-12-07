#!/bin/sh

die () {
    echo >&2 "$@"
    exit 1
}

CURRENT_DIR=`pwd`
ACCOUNT_KEY="$CURRENT_DIR/account.key"
CACHE_DIR="$CURRENT_DIR/cache"
DOWNLOAD_DIR="$CURRENT_DIR/downloads"

command -v tarsnap >/dev/null 2>&1 || { echo >&2 "Tarsnap is not installed. Aborting."; exit 1; }

echo "Downloading archive..."

[ "$#" -eq 1 ] || die "Please specify archive name as the first argument!"

TARGET_DIR="$DOWNLOAD_DIR/$1"
mkdir -p $TARGET_DIR

cd $TARGET_DIR

exec tarsnap -x -f $1 --keyfile $ACCOUNT_KEY --cachedir $CACHE_DIR

echo "Done! The archive has been downloaded to $DOWNLOAD_DIR/$1"