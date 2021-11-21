" Test repeat of alpha completion.

runtime tests/helpers/insert.vim
view AlphaComplete.txt
new

call SetCompletion("\<C-x>a")
call SetCompleteExpr('AlphaComplete#Expr')

call InsertRepeat('my:Find', 1, 0, 0, 0, 0)
call InsertRepeat('my:Find', 1, 0, 0, 0)
call InsertRepeat('my:Find', 1, 0, 0)
call InsertRepeat('my:Find', 1, 0)

call InsertRepeat('scr', 0, 2)

call InsertRepeat('nothing_witho', 0, 0, 0, 0)
call InsertRepeat('nothing_witho', 0, 0, 0, 0, 2)

call vimtest#SaveOut()
call vimtest#Quit()
