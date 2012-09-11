" AlphaComplete.vim: Insert mode completion based on any sequence of alphabetic characters.
"
" DEPENDENCIES:
"   - CompleteHelper.vim autoload script
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	12-Sep-2012	file creation

function! s:GetCompleteOption()
    return (exists('b:AlphaComplete_complete') ? b:AlphaComplete_complete : g:AlphaComplete_complete)
endfunction

function! AlphaComplete#AlphaComplete( findstart, base )
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
	call CompleteHelper#FindMatches( l:matches, '\%(^\|\A\)\zs\V' . escape(a:base, '\') . '\a\+', {'complete': s:GetCompleteOption()} )
	return l:matches
    endif
endfunction

function! AlphaComplete#Expr()
    set completefunc=AlphaComplete#AlphaComplete
    return "\<C-x>\<C-u>"
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
