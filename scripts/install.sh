#!/bin/sh
set -e

REPO_URL="https://github.com/chapp3070/typst-cover-for-B1/archive/refs/heads/main.zip"
PACKAGE_NAME="typst-cover-for-B1"
VERSION="0.1.0"

if [ "$(uname)" = "Darwin" ]; then
    TARGET_DIR="$HOME/Library/Application Support/typst/packages/local/$PACKAGE_NAME/$VERSION"
else
    TARGET_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/$PACKAGE_NAME/$VERSION"
fi

echo "Installing $PACKAGE_NAME v$VERSION to $TARGET_DIR..."

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

curl -fsSL "$REPO_URL" -o "$TMP_DIR/package.zip"
unzip -q "$TMP_DIR/package.zip" -d "$TMP_DIR"

mkdir -p "$TARGET_DIR"
rm -rf "$TARGET_DIR"/*
cp -r "$TMP_DIR/typst-cover-for-B1-main/"* "$TARGET_DIR/"

echo "Successfully installed $PACKAGE_NAME v$VERSION!"
