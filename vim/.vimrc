" load order is important (i.e. map 'leader' before mapping new things to it)
exe 'source' '~/scripts/vim/plugins.vim'
exe 'source' '~/scripts/vim/config.vim'
exe 'source' '~/scripts/vim/colors.vim'

for file in split(globpath('~/scripts/vim', 'plugin.*.vim'), '\n')
    exe 'source' file
endfor

exe 'source' '~/scripts/vim/mappings.vim'
