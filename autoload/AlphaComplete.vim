" AlphaComplete.vim: Insert mode completion based on any sequence of alphabetic characters.
"
" DEPENDENCIES:
"   - CompleteHelper.vim autoload script
"   - Complete/Repeat.vim autoload script
"
" Copyright: (C) 2012-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.01.004	08-Apr-2014	Adapt repeat pattern to match Vim's built-in
"				behavior.
"   1.01.003	07-Apr-2014	Make repeat across lines work.
"   1.00.002	14-Jul-2013	FIX: Remove duplicate \zs in repeat pattern.
"	001	12-Sep-2012	file creation

function! s:GetCompleteOption()
    return (exists('b:AlphaComplete_complete') ? b:AlphaComplete_complete : g:AlphaComplete_complete)
endfunction
let s:save_cpo = &cpo
set cpo&vim

let s:repeatCnt = 0
function! AlphaComplete#AlphaComplete( findstart, base )
    if s:repeatCnt
	if a:findstart
	    return col('.') - 1
	else
	    let l:matches = []

	    " Need to translate the embedded ^@ newline into the \n atom.
	    let l:previousCompleteExpr = substitute(escape(s:fullText, '\'), '\n', '\\n', 'g')

	    call CompleteHelper#FindMatches(l:matches,
	    \   '\V\%(\^\|\_A\)' . l:previousCompleteExpr . '\zs\%(\A\+\a\+\|\_s\+\A\*\a\+\|\_s\*\A\+\)',
	    \   {'complete': s:GetCompleteOption(), 'processor': function('CompleteHelper#Repeat#Processor')}
	    \)
	    if empty(l:matches)
		call CompleteHelper#Repeat#Clear()
	    endif
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

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
