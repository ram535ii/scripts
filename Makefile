DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

init: symlinks brew vim

symlinks:
	ln -sf ${DIR}/.bash_profile ~/.bash_profile
	ln -sf ${DIR}/.bashrc ~/.bashrc
	ln -sf ${DIR}/vim/.vimrc ~/.vimrc
	ln -sf ${DIR}/vim/.vim ~/.vim
	ln -sf ${DIR}/.tmux.conf ~/.tmux.conf
	ln -sf ${DIR}/.gitignore_global ~/.gitignore_global
	ln -sf ${DIR}/.rubocop.yml ~/.rubocop.yml
	ln -sf ${DIR}/tmux/.tmux.conf ~/.tmux.conf

brew:
	command -v brew > /dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew tap homebrew/bundle || echo ''
	brew upgrade
	brew bundle

vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ${DIR}/vim/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
