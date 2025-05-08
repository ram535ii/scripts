" Not really a plug, just Monzo stuff that is nice to group

" Pretty much never show all the generated files when browsing around.
set wildignore+=*.firehose.go
set wildignore+=*.pb.go
set wildignore+=*.proto.desc
set wildignore+=*.router.go
set wildignore+=*.streams.go
set wildignore+=*.typhon.go
set wildignore+=*.validator.go
set wildignore+=*.rule

" Mark generated files as read only so they don't get edited by mistake.
augroup Monzo
  au!

  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/vendor/*
    \ setlocal readonly
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/{service,cron}.*/manifests/*-template.{yml,yaml}
    \ setlocal readonly
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/{service,cron}.*/proto/*.{firehose.go,pb.go,proto.desc,router.go,streams.go,typhon.go,validator.go}
    \ setlocal readonly
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/service.*/crons/crons.json
    \ setlocal readonly
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/CODEOWNERS
    \ setlocal readonly

augroup END

let s:wearedev_path = expand("$GOPATH/src/github.com/monzo/wearedev")
function! s:svcname(fname) abort
	let l:absolute_fname = fnamemodify(a:fname, ":p")
	if stridx(l:absolute_fname, s:wearedev_path) != 0
		throw "fname not in wearedev?"
	endif

	let l:path_relative_to_wearedev = l:absolute_fname[strlen(s:wearedev_path) + 1:]
	let l:svcname = l:path_relative_to_wearedev[:stridx(l:path_relative_to_wearedev, "/") - 1]
	return l:svcname
endfunction

function! s:svcpath(fname) abort
	let l:svcname = s:svcname(a:fname)
	return s:wearedev_path . "/" . l:svcname
endfunction

augroup MonzoDispatch

  " Auto-generate CODEOWNERS when .CODEOWNERS.template changes.
  au BufWritePost $GOPATH/src/github.com/monzo/wearedev/.CODEOWNERS.template Dispatch
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/.CODEOWNERS.template
    \ let b:dispatch = expand("$GOPATH/src/github.com/monzo/wearedev/bin/generate_codeowners")

  " Auto-generate proto files when proto source files change.
  au BufWritePost $GOPATH/src/github.com/monzo/wearedev/service.*/proto/*.proto Dispatch
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/service.*/proto/*.proto
    \ let b:dispatch = join([
    \   expand("$GOPATH/src/github.com/monzo/wearedev/bin/generate_protobufs"),
    \   s:svcpath(expand("<afile>"))
    \ ])

  " Auto-generate manifests when the template changes.
  au BufWritePost $GOPATH/src/github.com/monzo/wearedev/{service,cron}.*/manifests/{custom,s101,prod}/*.{yml,yaml} Dispatch
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/{service,cron}.*/manifests/{custom,s101,prod}/*.{yml,yaml}
    \ let b:dispatch = join([
    \   expand("$GOPATH/src/github.com/monzo/wearedev/bin/generate_manifests"),
    \   s:svcpath(expand("<afile>"))
    \ ])

  " Auto-generate crons.json when the crons.go file changes.
  au BufWritePost $GOPATH/src/github.com/monzo/wearedev/service.*/crons/crons.go Dispatch
  au BufRead,BufNewFile $GOPATH/src/github.com/monzo/wearedev/service.*/crons/crons.go
    \ let b:dispatch = join([
    \   "go generate",
    \   expand("<afile>"),
    \ ])

  function! s:MaybeRunDaoGen() abort
    if search("^\/\/ Primary Table:", 'n') != 0
      let l:cmd = join([
      \   "svcgen",
      \   "gen-dao",
      \   s:svcname(expand("<afile>")),
      \ ])
      exe "Dispatch " .. l:cmd
    endif
  endfunction

  " Auto-generate dao (if necessary) when domain types change.
  au BufWritePost $GOPATH/src/github.com/monzo/wearedev/service.*/domain/*.{go} call s:MaybeRunDaoGen()

augroup END
