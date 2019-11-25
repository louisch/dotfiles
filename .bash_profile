if [[ ! $PROFILE_LOADED ]]; then
  source "${HOME}/.profile"
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
