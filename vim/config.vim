let mapleader = "\<Space>"

set number
set tabstop=2

set shiftwidth=2
" set expandtab                 " use spaces for tabs
" set list listchars=tab:▸\     " show me existing tabs
set mouse=nvi
set showcmd                   " show leader key
" set clipboard=unnamed         " let me copy out of vim!
syntax enable
set t_Co=256
set hlsearch

" Put a line at 80chars
let &colorcolumn="80"

" Checks the files for changes on filesystem when we get focus
au WinEnter * checktime

" backspace over everything in insert mode
set backspace=indent,eol,start

" Vim works in all size terminal windows
if has('mouse_sgr')
  set ttymouse=sgr
endif

"--- Whitespace
" Always strip whitespace for it be evil
autocmd BufWritePre * :%s/\s\+$//e

"--- File ignores
" Shows all the files when trying to open a new file and tabbing out
set wildmode=list:longest
" Ignores these files in ctrlp and tabbing out files
"  *.rule is for egress files
set wildignore+=*.swp,*.map,public/assets/*,*.rule

" quickfix window always takes full bottom
autocmd FileType qf wincmd J

" stop the little [Scratch] window from opening
" set completeopt-=preview
set completeopt=menu,menuone,noselect

" see live feedback when using :substitute
set inccommand=split

" escaping insert during multicursor preserves the cursor
let g:multi_cursor_exit_from_insert_mode = 0
