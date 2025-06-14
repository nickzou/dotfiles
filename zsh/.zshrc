# Default Programs
export EDITOR="nvim"

# ~/.zshrc
eval "$(starship init zsh)"

eval "$(zoxide init --cmd cd zsh)"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/nickzou/Library/Application Support/Herd/config/php/82/"

export GREP_OPTIONS='--color=always'

alias ls='lsd'
alias ll='lsd -alF'
alias la='lsd -A'
alias l='lsd -CF'

alias cat='bat'

alias nick@nas='ssh -i ~/.ssh/id_ed25519.pub nick-zou@10.0.0.106'

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
    alias whatscli=~/WhatsApp/whatscli/whatscli
fi
