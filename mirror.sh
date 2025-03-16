#!/bin/sh
set -e
SOURCE_REPO=$1
DESTINATION_REPO=$2
SOURCE_DIR=$(basename "$SOURCE_REPO")

echo "SOURCE=$SOURCE_REPO"
echo "DESTINATION=$DESTINATION_REPO"

git clone --mirror "$SOURCE_REPO" "$SOURCE_DIR"
cd "$SOURCE_DIR"
git remote add mirror-remote "$DESTINATION_REPO"
git push --mirror mirror-remote

echo "done"
