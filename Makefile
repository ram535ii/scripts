DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# order is important
init: symlinks brew npm nvim tmux general

symlinks:
	ln -sf ${DIR}/.bash_profile ~/.bash_profile
	ln -sf ${DIR}/.bashrc ~/.bashrc
	ln -sf ${DIR}/.zshrc ~/.zshrc
	ln -sf ${DIR}/.zshenv ~/.zshenv
	ln -sf ${DIR}/vim/.vimrc ~/.vimrc
	ln -sf ${DIR}/.tmux.conf ~/.tmux.conf
	ln -sf ${DIR}/.gitignore_global ~/.gitignore_global
	ln -sf ${DIR}/.gitconfig ~/.gitconfig
	ln -sf ${DIR}/.rubocop.yml ~/.rubocop.yml
	ln -sf ${DIR}/tmux/.tmux.conf ~/.tmux.conf

brew:
	command -v brew > /dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew tap homebrew/bundle || echo ''
	brew upgrade
	brew bundle

go:
	# Required for deoplete-go nvim plugin
	go get -u github.com/nsf/gocode
npm:
	# required for the zsh prompt
	npm install --global pure-prompt

nvim:
	ln -sf ~/.vim ~/.config/nvim
	ln -sf ${DIR}/vim/.vimrc ~/.config/nvim/init.vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	pip3 install neovim
	nvim +PlugInstall +UpdateRemotePlugins +qall

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins

general:
	# definitely worked on Sierra, required a logout
	defaults write -g InitialKeyRepeat -int 12 # normal minimum is 15 (225 ms)
	defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
