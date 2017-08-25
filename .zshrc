# set prompt
autoload -U promptinit; promptinit
export PURE_GIT_PULL=0 # yubi doesn't deal with pure fetching automatically
prompt pure

# Git autocompletion
autoload -Uz compinit && compinit

# import aliases
source ~/scripts/.aliases

# allow terminal file transfer
source ~/scripts/transfer.sh

# Basic Path Includes
path_items=(
  /usr/texbin
  /usr/local/heroku/bin                                # Added by Heroku Toolbest
  /Applications/Postgres.app/Contents/Versions/9.4/bin # Add PSQL to path
  /usr/local/bin
  $HOME/.rvm/bin
  $GOPATH/bin
  ~/Library/Python/2.7/bin
)

for i in ${path_items[@]}
do
  PATH=$PATH:$i
done

export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Necessary
export EDITOR="nvim"
# Make colors in neovim normal

# make direnv work
eval "$(direnv hook bash)"

# Z
source "$(brew --prefix)/etc/profile.d/z.sh"


# Monzo specific
if [ -f $HOME/src/github.com/monzo/starter-pack/zshrc ]; then
  source $HOME/src/github.com/monzo/starter-pack/zshrc
else
  # setup my Go workspace manually
  export GOPATH=$HOME/coding/go_workspace
fi

if [ -f $HOME/monzo_dotfiles/aliases ]; then
  source $HOME/monzo_dotfiles/aliases
fi

# Makes <C-a> <C-e> work in zsh+tmux
bindkey -e
