# set prompt
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
export PURE_GIT_PULL=0 # yubi doesn't deal with pure fetching automatically
prompt pure

# Git autocompletion
autoload -Uz compinit && compinit

# import aliases
source ~/scripts/.aliases

# allow terminal file transfer
source ~/scripts/transfer.sh

# Monzo specific
if [ -f $HOME/src/github.com/monzo/starter-pack/zshrc ]; then
  source $HOME/src/github.com/monzo/starter-pack/zshrc
else # setup my Go workspace manually
  export GOPATH=$HOME
fi

if [ -f $HOME/monzo_dotfiles/aliases ]; then
  source $HOME/monzo_dotfiles/aliases
fi

if [ -f $HOME/scripts/kubectl_aliases ]; then
	source $HOME/scripts/kubectl_aliases
fi

# Basic Path Includes.
# Must come _after_ GOPATH is set.
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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

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

# Makes <C-a> <C-e> work in zsh+tmux
bindkey -e

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/constantijnschepens/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/constantijnschepens/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/constantijnschepens/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/constantijnschepens/google-cloud-sdk/completion.zsh.inc'; fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/constantijnschepens/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
