let g:go_fmt_command = "goimports"

" ---------- shortcuts
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" it's smart enough to run tests for a non '_test' file
autocmd FileType go nmap <leader>t  <Plug>(go-test)

autocmd FileType go nmap <leader>l  <Plug>(go-lint)
autocmd FileType go nmap <leader>i  <Plug>(go-info)

" experiment to see how well this plays with syntastic - it will be
" responsible for opening location=list
let g:go_fmt_fail_silently = 1

" ---------- text highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

let g:syntastic_aggregate_errors = 1
