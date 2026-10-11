# mac-setup

Scripts and dotfiles for setting up a new Mac (Apple Silicon). The install script installs Homebrew if needed, installs everything in the Brewfile, and symlinks the dotfiles into your home directory.

## What's Included

| File | Purpose |
|------|---------|
| `install.sh` | Full setup: installs Homebrew if it's missing (and adds it to `~/.zprofile`), runs `brew update`, installs the Brewfile, then runs `bootstrap.sh` |
| `bootstrap.sh` | Symlinks the dotfiles into `~/` |
| `Brewfile` | Homebrew bundle: CLI tools, cask apps, Mac App Store apps, and VS Code extensions |
| `dotfiles/.zshrc` | Homebrew PATH/shellenv, Homebrew zsh completions, and a few aliases (`ll`, `gs`, `gb`, `gc`, `v`) |
| `dotfiles/.gitconfig` | Git identity, `main` as the default branch, merge-based pulls, the global gitignore, and the macOS Keychain credential helper |
| `dotfiles/.gitignore_global` | Ignores `.DS_Store`, `.vscode/`, and `*.log` |

### Brewfile highlights

- **CLI tools:** docker, docker-compose, caddy, mkcert, pandoc, trivy, subfinder, gping, bandwhich, glow, tldr, asciinema, mas
- **Casks:** Docker Desktop, GitHub Desktop, Obsidian, Raycast, VS Code
- **Mac App Store** (via `mas`): productivity, development, and Apple iWork/media apps
- **VS Code extensions:** Claude Code, GitLens, Prettier, GitHub PRs, Docker/containers, Remote SSH

## Usage

The repo is expected to live at `~/Projects/mac-setup`, because `bootstrap.sh` links from that path. Run the scripts from the repo directory, since `install.sh` finds the Brewfile relative to the current directory.

```bash
git clone <repo-url> ~/Projects/mac-setup
cd ~/Projects/mac-setup
./install.sh
```

Individual steps:

```bash
brew bundle --file="$(pwd)/Brewfile"   # packages only
bash bootstrap.sh                       # dotfiles only
```

Notes:

- `mas` installs only work when you're signed in to the App Store.
- `bootstrap.sh` uses `ln -sf`, so it replaces any existing `~/.zshrc`, `~/.gitconfig`, or `~/.gitignore_global` without making a backup. Back those files up first if you need them.
- Both scripts can be re-run safely on a machine that's already set up.
- If you fork this repo, change the name and email in `dotfiles/.gitconfig` to your own.
