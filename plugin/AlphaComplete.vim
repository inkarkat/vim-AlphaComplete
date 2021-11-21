" AlphaComplete.vim: Insert mode completion based on any sequence of alphabetic characters.
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher.
"   - AlphaComplete.vim autoload script
"
" Copyright: (C) 2012-2015 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.01.002	12-Jan-2015	Remove default g:AlphaComplete_complete
"				configuration and default to 'complete' option
"				value instead.
"   1.00.001	12-Sep-2012	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_AlphaComplete') || (v:version < 700)
    finish
endif
let g:loaded_AlphaComplete = 1

"- mappings --------------------------------------------------------------------

inoremap <silent> <expr> <Plug>(AlphaComplete) AlphaComplete#Expr()
if ! hasmapto('<Plug>(AlphaComplete)', 'i')
    imap <C-x>a <Plug>(AlphaComplete)
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
