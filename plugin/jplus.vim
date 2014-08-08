scriptencoding utf-8
if exists('g:loaded_jplus')
  finish
endif
let g:loaded_jplus = 1

let s:save_cpo = &cpo
set cpo&vim


function! s:config(base)
	return jplus#config(&filetype, a:base)
endfunction


noremap <silent> <Plug>(jplus-getchar)
\	:call jplus#join(<SID>config({ "delimiter": getchar() }))<CR>

noremap <silent> <Plug>(jplus-getchar-with-space)
\	:call jplus#join(<SID>config({ "delimiter": ' ' . jplus#getchar() . ' ' }))<CR>


noremap <silent> <Plug>(jplus-input)
\	:call jplus#join(<SID>config({ "delimiter": input("Input joint sep:") }))<CR>

noremap <silent> <Plug>(jplus-input-with-space)
\	:call jplus#join(<SID>config({ "delimiter": ' ' . input("Input joint sep:") . ' ' }))<CR>


noremap <silent> <Plug>(jplus)
\	:call jplus#join(<SID>config({}))<CR>


let &cpo = s:save_cpo
unlet s:save_cpo
