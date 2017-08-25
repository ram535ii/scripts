##############################
# Put everything in .bash_profile, this is where OSX will expect it to be.
#
# .bash_profile does source this file
# We still need this file because other packages will automatically source
# themselves here when they are installed.
# NOTE: this means anything in this file wasn't added by me and should be
# respected as being sensible.
##############################

export NVM_DIR="/Users/constantijnschepens/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=/usr/local/opt/android-sdk

# added by travis gem
[ -f /Users/constantijnschepens/.travis/travis.sh ] && source /Users/constantijnschepens/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/constantijnschepens/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/constantijnschepens/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/constantijnschepens/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/constantijnschepens/google-cloud-sdk/completion.bash.inc'
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
