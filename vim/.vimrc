" load order is important (i.e. map leader before mapping new things to it)
exe 'source' '~/scripts/vim/config.vim'
exe 'source' '~/scripts/vim/colors.vim'
exe 'source' '~/scripts/vim/plugins.vim'
exe 'source' '~/scripts/vim/mappings.vim'

for file in split(globpath('~/scripts/vim', 'plugin.*.vim'), '\n')
    exe 'source' file
endfor

"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors           = 0
let g:indent_guides_start_level           = 1
let g:indent_guides_guide_size            = 1



" Enable neocomplete by default
let g:neocomplete#enable_at_startup = 0

" Airline setting
" set laststatus=2 " Always show the bar
" set noshowmode   " Remove default mode indicator

" Enable jsx highlighting in js files
let g:jsx_ext_required = 0

" Filetypes for closetag to work int
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

" Customize the command run by :Ag
"   -S: smart-case - only case sensitive on caps
"   --nocolor: Don't show color codes
"   --nogroup: Don't grp results from one file
"   --colum: Print numbers in left column
"   --ignore: files to ignore
let g:ag_prg='ag -S --nocolor --nogroup --column'

" is the bit that actually highlights trailing whitespace
hi RedundantSpaces ctermbg=152
match RedundantSpaces /\s\+$/
autocmd BufWinEnter * match RedundantSpaces /\s\+$/
