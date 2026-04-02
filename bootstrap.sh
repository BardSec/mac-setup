#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/Projects/mac-setup"
DOTFILES_DIR="${REPO_DIR}/dotfiles"

mkdir -p "${HOME}/.config"

ln -sf "${DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
ln -sf "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${DOTFILES_DIR}/.gitignore_global" "${HOME}/.gitignore_global"

echo "Dotfiles linked successfully."
