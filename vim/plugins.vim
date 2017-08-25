call plug#begin('~/.vim/plugged')

" Layout
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

" Tools
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/Align'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'gcmt/taboo.vim'
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'dkprice/vim-easygrep'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'
Plug 'janko-m/vim-test'
Plug 'tmhedberg/matchit'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-unimpaired'

Plug 'wincent/ferret' "ripgrep
Plug 'brooth/far.vim', { 'do': ':UpdateRemotePlugins' } "interactive find and replace
Plug 'neomake/neomake' " easily run linters/compilers sync

" Neovim only
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'digitaltoad/vim-jade'
Plug 'mxw/vim-jsx'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'


call plug#end()
