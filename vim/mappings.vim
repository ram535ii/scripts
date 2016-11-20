"--- Window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
imap <C-J> <C-O><C-J>
imap <C-K> <C-O><C-K>
imap <C-L> <C-O><C-L>
imap <C-H> <C-O><C-H>
imap <C-w> <C-o><C-w>

"--- Buffers
" swap between last two buffers
noremap <leader><leader> :e #<CR>

" vim-rspec
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" tagbar
nmap <C-m> :TagbarToggle<CR>

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
