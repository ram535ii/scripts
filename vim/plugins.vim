call plug#begin('~/.vim/plugged')

" Layout
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'wincent/ferret' "ripgrep
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'

" Languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

"-------------------------
" Retired plugins - still interesting

" visible indent guides
" Plug 'nathanaelkane/vim-indent-guides'
