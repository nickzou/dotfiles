# Default Programs
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"

# ~/.zshrc
eval "$(starship init zsh)"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/nickzou/Library/Application Support/Herd/config/php/82/"

export GREP_OPTIONS='--color=always'

if command -v eza &> /dev/null; then
  alias ls='eza --icons=auto'
  alias ll='eza --icons=auto -alF'
  alias la='eza --icons=auto -A'
elif command -v lsd &> /dev/null; then
  alias ls='lsd'
  alias ll='lsd -alF'
  alias la='lsd -A'
fi

alias cat='bat'
alias vim='nvim'

alias tms='tmux new-session -s'

alias nick@nas='ssh -i ~/.ssh/id_ed25519.pub nick-zou@10.0.0.106'

alias fdp='file=$(fd -t f | fzf-tmux -p) && [ -n "$file" ] && nvim "$file"'

alias synckp='rclone bisync gdrive:notpassword ~/keepass --force'

zstyle ':completion:*' menu select
autoload -U compinit && compinit


if [[ "$OSTYPE" == "darwin" ]]; then
    export NVM_DIR="/Users/nickzou/Library/Application Support/Herd/config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

    [[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

    # Herd injected PHP 8.3 configuration.
    export HERD_PHP_83_INI_SCAN_DIR="/Users/nickzou/Library/Application Support/Herd/config/php/83/"


    # Herd injected PHP binary.
    export PATH="/Users/nickzou/Library/Application Support/Herd/bin/":$PATH
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export NVM_DIR="/home/nick/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    export PATH="/home/nick/.config/herd-lite/bin:$PATH"
    export PHP_INI_SCAN_DIR="/home/nick/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
fi

# bun completions
[ -s "/Users/nickzou/.bun/_bun" ] && source "/Users/nickzou/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# rust / cargo
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init --cmd cd zsh)"
export PATH="$HOME/.local/bin:$PATH"
