Useful little scripty widgets

# Required Setup
```sh
$ git clone https://github.com/ram535ii/scripts ~/scripts
$ cd ~/scripts
$ make init
```

# Vim
### Colors
- For my old skool vim:
  - .vimrc handles the color scheme selection for vim
    - Make sure base16-railscast.vim is in .vim/colors
  - for iTerm use iTermVimThemes/base16-railscast-custom.itermcolors as the color scheme (with mild transparency)
- For LazyVim:
  - Install a nice Nerd Font (to get icons): https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/RobotoMono/Regular/RobotoMonoNerdFont-Regular.ttf


# tmux
For vim-mode copy/paste to work, make sure the "Application in terminal may access clipboard" setting in iTerm2 is enabled. More info [here](https://github.com/tmux/tmux/issues/910).

# Git
### Git Hooks
- `git_template/hooks` is included in `.gitconfig` so any new git repo (actually anywhere you run `git init`) will get these hooks copied across. These can then be customized to that repo locally. Long term it way be worth looking at symlinking instead if I don't want to change them.
- If they a hook doesn't work, try `chmod +x` it, has caused me grief in the past
