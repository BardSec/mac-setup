#!/usr/bin/env bash
set -euo pipefail

echo "Installing Homebrew if needed..."
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing from Brewfile..."
brew bundle --file="$(pwd)/Brewfile"

echo "Running bootstrap..."
bash "$(pwd)/bootstrap.sh"

echo "Done."
