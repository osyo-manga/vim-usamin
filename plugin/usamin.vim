scriptencoding utf-8
if exists('g:loaded_usamin')
  finish
endif
let g:loaded_usamin = 1

let s:save_cpo = &cpo
set cpo&vim


nnoremap <Plug>(usamin-set) a<usa><min><ESC>

let g:usamin_enable = 0

command! -bar UsaminStart let g:usamin_enable = 1
command! -bar UsaminStop let g:usamin_enable = 0


augroup usamin
	autocmd!
	autocmd CursorHold  *
\	if g:usamin_enable
\|		call usamin#update()
\|		call feedkeys("g\<ESC>", 'n')
\|	endif

\	if g:usamin_enable
\|		call usamin#update()
\|		call feedkeys("\<C-g>\<ESC>", 'n')
\|	endif
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
