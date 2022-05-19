call plug#begin('~/.vim/plugged')

" Layout
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'wincent/ferret' "ripgrep
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'delabere/protodef'

" Monzo
Plug '~/src/github.com/monzo/wearedev/tools/editors/nvim/nvim-monzo'
Plug 'nvim-telescope/telescope.nvim' "has more optional stuff I can install
Plug 'nvim-lua/plenary.nvim' "telescope dependency
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "telescope dependency
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

"-------------------------
" Retired plugins - still interesting

" visible indent guides
" Plug 'nathanaelkane/vim-indent-guides'
