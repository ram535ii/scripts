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
inoremap jk <esc>
"disable Esc to learn 'jk'
inoremap <esc> <nop>
