"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set completeopt-=preview

" see live feedback when using :substitute
set inccommand=split

" escaping insert during multicursor preserves the cursor
let g:multi_cursor_exit_from_insert_mode = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

if has('nvim')
  " If we're using Neovim's builtin LSP support, let's disable a lot of the
  " auto-functionality in vim-go:
  let g:go_def_mapping_enabled = 0
  let g:go_term_enabled = 1
  let g:go_diagnostics_enabled = 0
  let g:go_code_completion_enabled = 0
  let g:go_fmt_autosave = 0
  let g:go_mod_fmt_autosave = 0
  let g:go_doc_keywordprg_enabled = 0
  let g:go_gopls_enabled = 0
  let g:go_diagnostics_enabled = 0

  " Configure LSP
  lua require("lsp")

  " Use <Tab> and <S-Tab> to navigate through popup menu
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " use <Tab> as trigger keys
  imap <Tab> <Plug>(completion_smart_tab)
  imap <S-Tab> <Plug>(completion_smart_s_tab)
  " Code navigation shortcuts
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gR    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> gld    <cmd>lua require('lsp_extensions.workspace.diagnostic').set_qf_list()<CR>
  " Set updatetime for CursorHold
  " 300ms of no cursor movement to trigger CursorHold
  set updatetime=300
  " Show diagnostic popup on cursor hold
  autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
  " Goto previous/next diagnostic warning/error
  nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  " have a fixed column for the diagnostics to appear in
  " this removes the jitter when warnings/errors flow in
  set signcolumn=yes
  " Enable type inlay hints
  autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
  \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Whitespace", enabled = {"ChainingHint", "TypeHint", "ParameterHint"} }
endif
