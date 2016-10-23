DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

init: brew

brew:
	command -v brew > /dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew tap homebrew/bundle || echo ''
	brew upgrade
	brew bundle
