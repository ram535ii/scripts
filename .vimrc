set nocompatible              " be iMproved, required
set number
set tabstop=2
set shiftwidth=2
set expandtab                 " use spaces for tabs
set list
set listchars=tab:>\.         " show me exisiting tabs
set mouse=nvi
set showcmd                   " show leader key
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
"personal tweaks
"highlight LineNr       ctermbg=236 ctermfg=240
highlight LineNr       ctermbg=NONE ctermfg=NONE
highlight Normal       ctermbg=NONE ctermfg=NONE

"colorscheme vimbrant
"highlight ColorColumn ctermbg=7
"highlight ColorColumn guibg=Gray

" vim-indent-guides overrides because ewwwww for defaults
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=235

" tabe bar colors
hi TabLineFill ctermfg=LightGreen ctermbg=NONE
hi TabLine ctermfg=Blue ctermbg=NONE
hi TabLineSel ctermfg=Red ctermbg=236
" Number of windows count per tab color
hi Title ctermfg=LightBlue ctermbg=Magenta

" GitGutter
let g:gitgutter_override_sign_column_highlight = 0
" highlight SignColumn ctermbg=234
highlight GitGutterAdd          ctermbg=NONE
highlight GitGutterChange       ctermbg=NONE
highlight GitGutterDelete       ctermbg=NONE
highlight GitGutterChangeDelete ctermbg=NONE
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
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/neocomplete.vim'

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

" Shows all the files when trying to open a new file and tabbing out
set wildmode=list:longest
" Ignores these files in ctrlp and tabbing out files
set wildignore+=*.swp,*.map,public/assets/*
let g:ctrlp_custom_ignore = {
\ 'dir': '\vpublic\/assets',
\ }

"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors           = 0
let g:indent_guides_start_level           = 1
let g:indent_guides_guide_size            = 1

" Clear all comment markers
 "map _ <leader>ci
 map - <leader>ci
 " Comment code
 "map - <leader>cl"

let NERDSpaceDelims=1          " Add a space before comments

" Checks the files for changes on filesystem when we get focus
au WinEnter * checktime

" vim-multiple-cursors (emulates sublime CMD-D)
let g:multi_cursor_next_key='<C-d>'                  " Use ctrl-d instead of ctrl-n
let g:multi_cursor_exit_from_insert_mode = 0         " Esc in insert mode doesn't leave multiline, go to normal instead

set backspace=indent,eol,start                       " backspace over everything in insert mode


" ---------------------------------------------------------------
" This is the bit that actually highlights trailing whitespace
hi RedundantSpaces ctermbg=152
match RedundantSpaces /\s\+$/
autocmd BufWinEnter * match RedundantSpaces /\s\+$/

" To make it show up in new tabs - use Ctrl-E
map ^E :match RedundantSpaces /\s\+$/ <CR>
" ---------------------------------------------------------------

" Enable neocomplete by default
let g:neocomplete#enable_at_startup = 1
