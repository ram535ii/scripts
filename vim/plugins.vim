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
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'wincent/ferret' "ripgrep
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Lua LSP fun
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'
Plug 'rafcamlet/nvim-luapad'

call plug#end()

"-------------------------
" Retired plugins - still interesting

" visible indent guides
" Plug 'nathanaelkane/vim-indent-guides'
