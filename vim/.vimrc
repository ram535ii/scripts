" load order is important (i.e. map leader before mapping new things to it)
exe 'source' '~/scripts/vim/config.vim'
exe 'source' '~/scripts/vim/colors.vim'
exe 'source' '~/scripts/vim/mappings.vim'




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
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Set no max number of files to index, otherwise in large repos not everything
" shows up
let g:ctrlp_max_files=0

"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors           = 0
let g:indent_guides_start_level           = 1
let g:indent_guides_guide_size            = 1


let NERDSpaceDelims=1          " Add a space before comments

" Checks the files for changes on filesystem when we get focus
au WinEnter * checktime

set backspace=indent,eol,start                       " backspace over everything in insert mode


" ---------------------------------------------------------------
" Always strip whitespace for it be evil
autocmd BufWritePre * :%s/\s\+$//e

" This is the bit that actually highlights trailing whitespace
hi RedundantSpaces ctermbg=152
match RedundantSpaces /\s\+$/
autocmd BufWinEnter * match RedundantSpaces /\s\+$/

" ---------------------------------------------------------------

" Enable neocomplete by default
let g:neocomplete#enable_at_startup = 0

" Airline setting
" set laststatus=2 " Always show the bar
" set noshowmode   " Remove default mode indicator

" Put a line at 80chars
let &colorcolumn="80"

" Enable jsx highlighting in js files
let g:jsx_ext_required = 0

" Filetypes for closetag to work int
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

" Customize the command run by :Ag
"   -S: smart-case - only case sensitive on caps
"   --nocolor: Don't show color codes
"   --nogroup: Don't grp results from one file
"   --colum: Print numbers in left column
"   --ignore: files to ignore
let g:ag_prg='ag -S --nocolor --nogroup --column'
