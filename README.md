Useful little scripty widgets

# Required Setup
- Run `brew_setup` to get required brews (best approximation)
- Run `symlink_setup` from home to automatically configure symlinks for all files that should live in home

# Vim
### Basic Setup
- run `git submodule init`
- run `git submodule update` to install Vundle
- open vim and run ':PluginInstall' to install all other plugins

### Colors
- .vimrc handles the color scheme selection for vim
  - Make sure base16-railscast.vim is in .vim/colors
- for iTerm use iTermVimThemes/base16-railscast-custom.itermcolors as the color scheme (with mild transparency)

### Git Hooks
- `git_template/hooks` is included in `.gitconfig` so any new git repo (actually anywhere you run `git init`) will get these hooks copied across. These can then be customized to that repo locally. Long term it way be worth looking at symlinking instead if I don't want to change them. 
- If they a hook doesn't work, try `chmod +x` it, has caused me grief in the past
