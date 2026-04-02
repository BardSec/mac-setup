export PATH="/opt/homebrew/bin:$PATH"

alias ll="ls -la"
alias gs="git status"
alias gb="git branch"
alias gc="git commit"
alias v="code ."

eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew completions if installed
if [ -f /opt/homebrew/share/zsh/site-functions/_brew ]; then
  fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fi
