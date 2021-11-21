" Test repeat of alpha completion across lines.

runtime tests/helpers/insert.vim
view AlphaComplete.txt
new

call SetCompletion("\<C-x>a")
call SetCompleteExpr('AlphaComplete#Expr')

call InsertRepeat('my:opt', 1, 0, 0, 0, 0, 0)
call InsertRepeat('my:opt', 2, 0)
call InsertRepeat('my:opt', 1, 0, 2)
call InsertRepeat('my:opt', 1, 2, 1, 0, 0, 0, 0)

call vimtest#SaveOut()
call vimtest#Quit()
