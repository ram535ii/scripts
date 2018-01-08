"--- Buffers
" swap between last two buffers
noremap <leader><leader> :e #<CR>

" tagbar
" nmap <C-m> :TagbarToggle<CR>

" ctags
nnoremap <C-b> <C-]>

"--- Comments
" Clear all comment markers
map - <leader>ci
" Comment code
"map - <leader>cl"

"--- Whitespace
" To make it show up in new tabs - use Ctrl-E
map ^E :match RedundantSpaces /\s\+$/ <CR>


"--- Advanced training
inoremap <C-e> <esc>
vnoremap <C-e> <esc>
nnoremap <C-e> <esc>
"disable Esc to learn 'jk'
inoremap <esc> <nop>

" open vimrc from anywhere
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" omg, so much easier to see next occurance!
nnoremap n nzz
nnoremap N Nzz
