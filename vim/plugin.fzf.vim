" ctrl-x ctrl-f to select-all and open in quickfix
" https://github.com/junegunn/fzf.vim/issues/185
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let $FZF_DEFAULT_OPTS = '--bind ctrl-x:select-all'

" extra key bindings
let g:fzf_action = {
  \ 'ctrl-f': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <silent> <leader>pp :FZF<CR>
nnoremap <silent> <leader>pf :GFiles --cached --others --exclude-standard<CR>
nnoremap <silent> <leader>ps :exe ':GFiles --cached --others --exclude-standard ' . split(expand('%'), '/')[0]<CR>

" current open buffers shown via fzf
" nnoremap <silent> <leader>b       :Buffers<CR>

" g is for 'grep', small window ripgrep shown via fzf
nnoremap <silent> <leader>g :Rg<CR>
" rg uses two letters, so it's full screen rg shown via fzf
nnoremap <silent> <leader>rg :Rg!<CR>

" when using :Rg, only search the file contents fuzzily, rather than both
" filename and contents
" https://github.com/junegunn/fzf.vim/issues/714#issuecomment-428802659
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
