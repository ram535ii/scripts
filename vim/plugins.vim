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

" Languages
" Using vim-go primarily for syntax highlighting, building, alternating to
" test files and running tests.
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Monzo
Plug '~/src/github.com/monzo/wearedev/tools/editors/nvim/nvim-monzo'
Plug 'nvim-telescope/telescope.nvim' "has more optional stuff I can install
Plug 'nvim-lua/plenary.nvim' "telescope dependency
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "telescope dependency
Plug 'neovim/nvim-lspconfig'
"cmp dependencies
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" nice to have
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

"-------------------------
" Retired plugins - still interesting

" visible indent guides
" Plug 'nathanaelkane/vim-indent-guides'
