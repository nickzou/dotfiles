export NVM_DIR="/Users/nickzou/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/nickzou/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/nickzou/Library/Application Support/Herd/bin/":$PATH

# ~/.zshrc
eval "$(starship init zsh)"


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/nickzou/Library/Application Support/Herd/config/php/82/"
