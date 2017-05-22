# set prompt
autoload -U promptinit; promptinit
prompt pure

### Helper Scripts
#
# Git autocompletion
# source ~/scripts/git-completion.bash

#import aliases
source ~/scripts/.aliases

# allow terminal file transfer
source ~/scripts/transfer.sh

# setup my Go workspace
# export GOPATH=$HOME/coding/go_workspace

### Basic Path Includes
#
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

### Twistilled Specific Setup
#
if [ -f $HOME/scripts_twistilled/twistilled.bashrc ]; then
  source $HOME/scripts_twistilled/twistilled.bashrc
fi

herokuDatabase(){
#	heroku pgbackups:capture;
  curl -o latest.dump `heroku pgbackups:url`;
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U constantijnschepens -d landingheroku_development latest.dump;
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Necessary
export EDITOR="vim"
# Make colors in neovim normal
export TERM=xterm-256color

# source ~/.iterm2_shell_integration.`basename $SHELL`

source ~/scripts/.bashrc

# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# make direnv work
eval "$(direnv hook bash)"

# Z
source "$(brew --prefix)/etc/profile.d/z.sh"

[ -f $HOME/src/github.com/monzo/starter-pack/zshrc ] && source $HOME/src/github.com/monzo/starter-pack/zshrc
