" config shamelessly stolen:
" from https://github.com/guillaumebreton/dotfiles/blob/master/nvim/config/plugins/neomake.vim
if executable('goimports')
	let g:neomake_go_goimports_maker = {
				\ 'exe': 'goimports',
				\ 'args': ['-w'],
				\ 'errorformat':
				\ '%f:%l:%c: %m,' .
				\ '%-G%.%#'
				\ }
endif

if executable('golint')
	let g:neomake_go_golint_maker = {
				\ 'exe': 'golint',
				\ 'args': ['-w'],
				\ 'errorformat':
				\ '%f:%l:%c: %m,' .
				\ '%-G%.%#'
				\ }
endif

if executable('govet')
	let g:neomake_go_govet_maker = {
				\ 'exe': 'govet',
				\ 'args': ['-w'],
				\ 'errorformat':
				\ '%f:%l:%c: %m,' .
				\ '%-G%.%#'
				\ }
endif

let g:neomake_go_enabled_makers = ['goimports', 'govet', 'golint', 'go']

" hardcoding of config here is HORRIBLE
if executable('prettier')
	let g:neomake_javascript_prettier_maker = {
				\ 'exe': 'prettier',
				\ 'args': ['--write', '--config', '~/src/github.com/monzo/web-projects/.prettierrc'],
				\ 'errorformat':
				\ '%f:%l:%c: %m,' .
				\ '%-G%.%#'
				\ }
endif

let g:neomake_javascript_enabled_makers = ['prettier']

let g:neomake_open_list   = 2
let g:neomake_list_height = 5
let g:neomake_verbose     = 1


" autocmd! BufWritePost * Neomake
command Errors lopen


autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))

function! s:Neomake_callback(options)
	if(a:options.status == 0)
		edit
		checktime
	endif
endfunction

