"--- Buffers
" swap between last two buffers
noremap <leader><leader> :e #<CR>

" tagbar
" nmap <C-m> :TagbarToggle<CR>

" ctags
nnoremap <C-b> <C-]>


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

" quickfix shortcuts
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <C-q> :cclose<CR>

" space + yy = copy to clipboard
vnoremap <leader>yy "+y
