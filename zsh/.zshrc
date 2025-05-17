export NVM_DIR="/Users/nickzou/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/nickzou/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/nickzou/Library/Application Support/Herd/bin/":$PATH

# Default Programs
export EDITOR="nvim"

# ~/.zshrc
eval "$(starship init zsh)"

eval "$(zoxide init --cmd cd zsh)"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/nickzou/Library/Application Support/Herd/config/php/82/"

alias ls='lsd'
alias ll='lsd -alF'
alias la='lsd -A'
alias l='lsd -CF'

alias nick@nas='ssh -i ~/.ssh/id_ed25519.pub nick-zou@10.0.0.106'
