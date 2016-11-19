let g:ctrlp_custom_ignore = {
\ 'dir': '\vpublic\/assets',
\ }
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Set no max number of files to index, otherwise in large repos not everything
" shows up
let g:ctrlp_max_files=0

