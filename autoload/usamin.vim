scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:count = 0
let s:last_time = 0
function! usamin#get_usamin()
	let time = str2float(reltimestr(reltime()))
	let usamin =[
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！",
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！ﾐﾐﾐﾝ！",
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！ﾐﾐﾐﾝ！ｳｰ",
	\		"(*ﾟ∀ﾟ)o彡ﾟﾐﾐﾐﾝ！ﾐﾐﾐﾝ！ｳｰｻﾐﾝ!!",
	\]
	if (time - s:last_time) > 0.45
		let s:count += 1
		let s:last_time = time
	endif
	return usamin[ s:count % len(usamin) ]
endfunction


function! usamin#update()
	syntax match tagUsaminHiddenBegin /<usa>/ conceal
	syntax match tagUsaminHiddenEnd  /<\/min>/ conceal

	if &modifiable
		let usamin = usamin#get_usamin()
		call map(map(getline(1, "$"), 'substitute(v:val, ''<usa>\zs.\{-}\ze<\/min>'', usamin, ''g'')'), 'setline(v:key+1, v:val)')
	endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
