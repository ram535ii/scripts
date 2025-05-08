DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# order is important
init: symlinks brew nvim tmux general

symlinks:
	ln -sf ${DIR}/.bash_profile ~/.bash_profile
	ln -sf ${DIR}/.bashrc ~/.bashrc
	ln -sf ${DIR}/.zshrc ~/.zshrc
	ln -sf ${DIR}/.zprofile ~/.profile
	ln -sf ${DIR}/.zshenv ~/.zshenv
	ln -sf ${DIR}/vim/.vimrc ~/.vimrc
	ln -sf ${DIR}/.tmux.conf ~/.tmux.conf
	ln -sf ${DIR}/.gitignore_global ~/.gitignore_global
	ln -sf ${DIR}/.gitconfig ~/.gitconfig
	ln -sf ${DIR}/tmux/.tmux.conf ~/.tmux.conf
	ln -sf ${DIR}/cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update
	brew tap homebrew/bundle || echo ''
	brew upgrade
	brew bundle

nvim:
	ln -sf ~/.vim ~/.config/nvim
	ln -sf ${DIR}/vim/.vimrc ~/.config/nvim/legacy-init.vim
	ln -sf ${DIR}/vim/init.lua ~/.config/nvim/init.lua
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	pip3 install neovim
	nvim +PlugInstall +UpdateRemotePlugins +qall

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	# If the below doesn't work <tmux-prefix>+I will do it.
	~/.tmux/plugins/tpm/bin/install_plugins

general:
	# definitely worked on Sierra, required a logout
	defaults write -g InitialKeyRepeat -int 12 # normal minimum is 15 (225 ms)
	defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
	defaults write -g ApplePressAndHoldEnabled -bool false
