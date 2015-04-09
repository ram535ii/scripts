# ANSI color codes
RS="\[\033[0m\]" # reset
HC="\[\033[1m\]" # hicolor
UL="\[\033[4m\]" # underline
INV="\[\033[7m\]" # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
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

#export PS1="$FBLU[\#]$RS--$RS{\t}$RS$FWHT\W$RS$FMAG@$RS$FRED\u$RS$FCYN\$$RS$FBLU>>>$RS"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

########ALIASES######
#ECS Remote Desktop
alias robinrdp='ssh -L 3389:robin:3389 cs7g10@uglogin.ecs.soton.ac.uk'
alias roordp='ssh -L 3389:roo:3389 cs7g10@uglogin.ecs.soton.ac.uk'

#Mouse Acceleration
alias disableaccel='defaults write .GlobalPreferences com.apple.mouse.scalin    g -1'
alias enableaccel='defaults write .GlobalPreferences com.apple.mouse.scaling     1'

alias tytossh='ssh -p 9564 constantijn@178.62.100.172'
alias chromeopen='open /Applications/Google\ Chrome.app --args --allow-file-access-from-files --disable-web-security'
alias prc='vi ../.git/hooks/pre-commit'

#Twistilled
alias red='redis-server /usr/local/etc/redis.conf'
alias fs='foreman start'
alias fc='foreman run rails c'

export PATH="/usr/texbin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# RVM Stuff
source ~/.profile

#Add PSQL to path
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

herokuDatabase(){
#	heroku pgbackups:capture;
	curl -o latest.dump `heroku pgbackups:url`;
	pg_restore --verbose --clean --no-acl --no-owner -h localhost -U constantijnschepens -d landingheroku_development latest.dump;
}

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
EDITOR="vim"
