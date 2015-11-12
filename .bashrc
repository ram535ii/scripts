##############################
# Put everything in .bash_profile, this is where OSX will expect it to be.
#
# .bash_profile does source this file
# We still need this file because other packages will automcatically source
# themselves here when they are installed.
# NOTE: this means anything in this file wasn't added my me and should be
# respected as being sensible.
##############################

export NVM_DIR="/Users/constantijnschepens/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
