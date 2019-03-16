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

alias ts="tmuxinator"

# export PATH=/home/mauricio/node_modules/mongodb-migrations/bin:$PATH
export EDITOR='nvim'
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=/home/mauricio/projects/javascript/mongodb-migrations/bin:$PATH
export PATH=/home/mauricio/Software/eta:$PATH
export PATH="$HOME/Software/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
