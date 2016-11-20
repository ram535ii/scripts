if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim
  https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'Shougo/neocomplete.vim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
" Plug 'bling/vim-airline'
Plug 'vim-scripts/Align'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'
Plug 'edsono/vim-matchit'
Plug 'gcmt/taboo.vim'
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'dkprice/vim-easygrep'
Plug 'ervandew/supertab'
Plug 'derekwyatt/vim-scala'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'

call plug#end()
