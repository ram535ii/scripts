set background=dark

" Set the following colors as the color scheme for iTerm so it corresponds to
" Vim
"base16-railscasts-custom.dark.256.itermcolors
"https://github.com/chrishunt/color-schemes
colorscheme base16-railscasts
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
"personal tweaks
"highlight LineNr       ctermbg=236 ctermfg=240
highlight LineNr       ctermbg=NONE ctermfg=NONE
highlight Normal       ctermbg=NONE ctermfg=NONE

"colorscheme vimbrant
"highlight ColorColumn ctermbg=7
"highlight ColorColumn guibg=Gray

" tabe bar colors
hi TabLineFill ctermfg=LightGreen ctermbg=NONE
hi TabLine ctermfg=Blue ctermbg=NONE
hi TabLineSel ctermfg=Red ctermbg=236
" Number of windows count per tab color
hi Title ctermfg=LightBlue ctermbg=Magenta

"--- Plugin Specific
" vim-indent-guides overrides because ewwwww for defaults
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=235

" GitGutter
let g:gitgutter_override_sign_column_highlight = 0
" highlight SignColumn ctermbg=234
highlight GitGutterAdd          ctermbg=NONE
highlight GitGutterChange       ctermbg=NONE
highlight GitGutterDelete       ctermbg=NONE
highlight GitGutterChangeDelete ctermbg=NONE
