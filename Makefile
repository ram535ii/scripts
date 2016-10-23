DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

init: symlinks brew

symlinks:
	ln -sf ${DIR}/.bash_profile ~/.bash_profile
	ln -sf ${DIR}/.bashrc ~/.bashrc
	ln -sf ${DIR}/.vimrc ~/.vimrc
	ln -sf ${DIR}/.vim ~/.vim
	ln -sf ${DIR}/.tmux.conf ~/.tmux.conf
	ln -sf ${DIR}/.gitignore_global ~/.gitignore_global
	ln -sf ${DIR}/.rubocop.yml ~/.rubocop.yml

brew:
	command -v brew > /dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew tap homebrew/bundle || echo ''
	brew upgrade
	brew bundle
