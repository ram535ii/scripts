" load order is important (i.e. map 'leader' before mapping new things to it)
exe 'source' '~/scripts/vim/config.vim'
exe 'source' '~/scripts/vim/colors.vim'
exe 'source' '~/scripts/vim/plugins.vim'
exe 'source' '~/scripts/vim/mappings.vim'

for file in split(globpath('~/scripts/vim', 'plugin.*.vim'), '\n')
    exe 'source' file
endfor

" is the bit that actually highlights trailing whitespace
hi RedundantSpaces ctermbg=152
match RedundantSpaces /\s\+$/
autocmd BufWinEnter * match RedundantSpaces /\s\+$/
