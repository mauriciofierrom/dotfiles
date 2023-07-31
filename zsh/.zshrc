source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Various plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Load the spaceship theme.
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# Tell Antigen that you're done.
antigen apply

setopt histignorespace

alias u="cd .."
alias t="tree -L"
alias ts="tmuxinator"
alias cb="cabal build"
alias cbe="cabal build && cabal exec $(basename $(pwd))"

export EDITOR="nvim"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/Software/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/Software/firefox:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
if [ -e /home/mauricio/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mauricio/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
[ -f "/home/mauricio/.ghcup/env" ] && source "/home/mauricio/.ghcup/env" # ghcup-env

eval "$(direnv hook zsh)"
