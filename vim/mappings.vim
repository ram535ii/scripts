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
nnoremap <C-b> :cprevious<CR>
nnoremap <C-q> :cclose<CR>

" space + yy = copy to clipboard
vnoremap <leader>yy "+y

" Monzo-specific, navigate directly to handler definition from proto request.
nnoremap gh :let pp=getpos('.')<CR>:let res=split(system('handlertool '.shellescape(expand('%:p').':'.line('.').':'.col('.'))), ':')<CR>:e <C-R>=res[0]<CR><CR>:call setpos('.',[pp[0],res[1],res[2],0])<CR>
