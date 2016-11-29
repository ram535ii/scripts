" By default this plug maps <C-hjkl> to enable you to switch between vim
" splits AND tmux splits

" https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
" this is a total hack as I'm not comfortable doing the suggested change yet
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

