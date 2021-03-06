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
# export TERM=xterm-256color
# [[ $TMUX = "" ]] && export TERM="xterm-256color"

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Makes <C-a> <C-e> work in zsh+tmux
bindkey -e

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/constantijnschepens/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;