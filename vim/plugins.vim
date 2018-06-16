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
" Plug 'vim-scripts/Align'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-repeat'
" Plug 'alvan/vim-closetag'
" Plug 'gcmt/taboo.vim'
" Plug 'sickill/vim-pasta'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'tpope/vim-unimpaired'

" Plug 'neomake/neomake' " easily run linters/compilers sync

" Neovim only
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

" Languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }


call plug#end()

" Retired plugins - still interesting
" cTags
" Plug 'xolox/vim-easytags'
" Plug 'xolox/vim-misc'
" Plug 'majutsushi/tagbar'

" find/replace
" Plug 'brooth/far.vim', { 'do': ':UpdateRemotePlugins' } "interactive find and replace
" Plug 'dkprice/vim-easygrep'

" testing
" Plug 'janko-m/vim-test'

" visible indent guides
" Plug 'nathanaelkane/vim-indent-guides'
