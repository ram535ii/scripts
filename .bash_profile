#--------- PS1 Related Stuff ----------------
# ANSI color codes
RS="\[\033[0m\]" # reset
HC="\[\033[1m\]" # hicolor
UL="\[\033[4m\]" # underline
INV="\[\033[7m\]" # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\e[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLU="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# Load in the git branch prompt script
# This is used in the PS1
source ~/scripts/git-prompt.sh
GIT_PS1_SHOWUPSTREAM="auto"

export PS1="$FBLU[\#]$FGRN{\t}$FCYN\W$FCYN$FYEL@$FYEL\u$FRED\$(__git_ps1 '(%s)')$FCYN\$$FBLU>>>$RS"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#------- PS1 Related Stuff End  --------------

### Helper Scripts
#
# Git autocompletion
source ~/scripts/git-completion.bash

#import aliases
source ~/scripts/.aliases

# allow terminal file transfer
source ~/scripts/transfer.sh

### Basic Path Includes
#
path_items=(
  /usr/texbin
  /usr/local/heroku/bin                                # Added by Heroku Toolbest
  /Applications/Postgres.app/Contents/Versions/9.4/bin # Add PSQL to path
  /usr/local/bin
  $HOME/.rvm/bin
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

source ~/scripts/.bashrc
