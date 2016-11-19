set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"===========Vundle=================
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'Shougo/neocomplete.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
" Plugin 'bling/vim-airline'
Plugin 'vim-scripts/Align'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-repeat'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'edsono/vim-matchit'
Plugin 'gcmt/taboo.vim'
Plugin 'sickill/vim-pasta'
Plugin 'sjl/gundo.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'ervandew/supertab'
Plugin 'derekwyatt/vim-scala'

" Github Plugins
"Plugin 'tpope/vim-fugitive'

" vim-scripts.org Plugins
"Plugin 'L9'

" Git (non-Github) Plugins
"Plugin 'git://git.wincent.com/command-t.git'

" Local Plugins (development)
"Plugin 'file:///home/gmarik/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"==========VundleEnd==========
