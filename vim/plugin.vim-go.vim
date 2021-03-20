" let g:go_fmt_autosave=1 " Let Neomake do the work
" let g:go_fmt_command = "goimports"

" save automatically before :make
set autowrite


" Disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" Disable code completion too, we'll let COC handle this.
let g:go_code_completion_enabled = 0

" Disable gopls until I can figure out how to make it share the same instance
" with coc. https://github.com/josa42/coc-go/issues/76
let g:go_gopls_enabled = 0
" auto :GoInfo, can only use this if gopls is enabled, coc should do this
" better anyway.
" let g:go_auto_type_info = 1

" ---------- shortcuts
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" it's smart enough to run tests for a non '_test' file
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd FileType go nmap <leader>l  <Plug>(go-lint)
autocmd FileType go nmap <leader>i  <Plug>(go-info)

autocmd FileType go nmap <leader>a  :GoAlternate<CR>

" experiment to see how well this plays with syntastic - it will be
" responsible for opening location=list
let g:go_fmt_fail_silently = 1

" ---------- text highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_format_strings = 1


let g:syntastic_aggregate_errors = 1

" autocmd BufWritePre *.go :GoBuild
" autocmd BufWritePre *.go :call <SID>build_go_files()
