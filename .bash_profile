if [[ ! $PROFILE_LOADED ]]; then
  source "${HOME}/.profile"
fi

if [[ ! $INTERACTIVE_LOADED ]]; then
  source "${HOME}/.bashrc"
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
