export PROFILE_LOADED=loaded

export XDG_CONFIG_HOME="${HOME}/.config"

# Path for fresh
export PATH="${PATH}:${HOME}/bin"

# Editor
export EDITOR="nvim"

# Android
case `uname` in
  Darwin)
    export ANDROID_HOME=${HOME}/Library/Android/Sdk
    ;;
  Linux)
    export ANDROID_HOME=${HOME}/Android/Sdk
    ;;
esac
export PATH="${PATH}:${ANDROID_HOME}/emulator"
export PATH="${PATH}:${ANDROID_HOME}/tools"
export PATH="${PATH}:${ANDROID_HOME}/tools/bin"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"

# Node
export PATH="${HOME}/.node_modules/bin:${PATH}"
export PATH="${PATH}:${HOME}/.yarn/bin"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ ! -d $NVM_DIR ]]; then
  printf "Warning! nvm not installed! node/npm will not function. See https://github.com/nvm-sh/nvm#installation-and-update for instructions.\n"
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# PHP
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Python
export PATH="${PATH}:${HOME}/.local/bin"
export PYTHON_SYSTEM_SITE_PACKAGES=$(python3 -m site | grep '^USER_SITE' | sed "s/USER_SITE: '//" | sed "s/' (exists)//")

# Ruby
export PATH="${PATH}:${HOME}/.gem/ruby/2.6.0/bin:/usr/local/lib/ruby/gems/2.6.0/bin/"
export PATH="/usr/local/opt/ruby/bin:${PATH}"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Rust
export PATH="${PATH}:${HOME}/.cargo/bin"

# MacOS specific
case `uname` in
  Darwin)
    # test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
    export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"

    # Locales
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    ;;
esac
