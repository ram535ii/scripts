set nocompatible              " be iMproved, required
set number
set tabstop=2
set shiftwidth=2
set mouse=nvi
syntax enable
filetype off                  " required for Vundle
set t_Co=256

"---------Colors--------------
set background=dark

"base16-railscasts-custom.dark.256.itermcolors
"https://github.com/chrishunt/color-schemes
colorscheme base16-railscasts 
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
highlight LineNr       ctermbg=NONE ctermfg=NONE
"highlight LineNr       ctermbg=23 ctermfg=NONE
highlight Normal			 ctermbg=NONE ctermfg=NONE

"colorscheme vimbrant
"highlight ColorColumn ctermbg=7
"highlight ColorColumn guibg=Gray
"---------ColorsEnd--------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"===========Vundle=================
" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" :help ctrlp.txt
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'

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
" Put your non-Plugin stuff after this line

" Vim works in all size terminal windows
if has('mouse_sgr')
	set ttymouse=sgr
endif
