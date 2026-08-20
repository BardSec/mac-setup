# Mac Setup

Automated Mac environment setup. Installs Homebrew packages, links dotfiles,
configures development tools for a new machine.

## Structure

```
install.sh          # Main setup orchestrator
bootstrap.sh        # Symlink dotfiles to ~/
Brewfile            # Homebrew bundle (brew, cask, mas, vscode extensions)
dotfiles/
  .zshrc
  .gitconfig
  .gitignore_global
```

## Usage

```bash
./install.sh        # full setup: Homebrew + Brewfile + dotfiles
```

Or individual steps:

```bash
brew bundle --file="$(pwd)/Brewfile"    # install packages only
bash bootstrap.sh                        # link dotfiles only
```

## Key Patterns

- Brewfile includes `brew`, `cask`, `mas` (Mac App Store), and `vscode` entries
- `bootstrap.sh` backs up existing files to `*.bak` before symlinking
- Idempotent — safe to re-run on an already-configured machine
- Symlinks point to `~/Projects/mac-setup/dotfiles/`
