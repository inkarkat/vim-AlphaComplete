" AlphaComplete.vim: Insert mode completion based on any sequence of alphabetic characters.
"
" DEPENDENCIES:
"   - CompleteHelper.vim autoload script
"   - Complete/Repeat.vim autoload script
"
" Copyright: (C) 2012-2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	002	14-Jul-2013	FIX: Remove duplicate \zs in repeat pattern.
"	001	12-Sep-2012	file creation

function! s:GetCompleteOption()
    return (exists('b:AlphaComplete_complete') ? b:AlphaComplete_complete : g:AlphaComplete_complete)
endfunction

let s:repeatCnt = 0
function! AlphaComplete#AlphaComplete( findstart, base )
    if s:repeatCnt
	if a:findstart
	    return col('.') - 1
	else
	    let l:matches = []
	    call CompleteHelper#FindMatches(l:matches, '\V\%(\^\|\A\)' . escape(s:fullText, '\') . '\zs\A\+\a\*', {'complete': s:GetCompleteOption()})
	    return l:matches
	endif
    endif

    if a:findstart
	" Locate the start of the alphabetic characters.
	let l:startCol = searchpos('\a*\%#', 'bn', line('.'))[1]
	if l:startCol == 0
	    let l:startCol = col('.')
	endif
	return l:startCol - 1 " Return byte index, not column.
    else
	" Find matches starting with a:base and containing just alphabetic
	" characters. The match can start anywhere except after an alphabetic
	" character.
	let l:matches = []
	call CompleteHelper#FindMatches(l:matches, '\V\%(\^\|\A\)\zs' . escape(a:base, '\') . '\a\+', {'complete': s:GetCompleteOption()})
	return l:matches
    endif
endfunction

function! AlphaComplete#Expr()
    set completefunc=AlphaComplete#AlphaComplete

    let s:repeatCnt = 0 " Important!
    let [s:repeatCnt, l:addedText, s:fullText] = CompleteHelper#Repeat#TestForRepeat()

    return "\<C-x>\<C-u>"
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
