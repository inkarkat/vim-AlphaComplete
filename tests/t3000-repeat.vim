" Test repeat of alpha completion.

source ../helpers/insert.vim
view AlphaComplete.txt
new

call SetCompletion("\<C-x>a")

call InsertRepeat('my:Find', 1, 0, 0, 0, 0)
call InsertRepeat('my:Find', 1, 0, 0, 0)
call InsertRepeat('my:Find', 1, 0, 0)
call InsertRepeat('my:Find', 1, 0)

call InsertRepeat('scr', 0, 2)

call InsertRepeat('nothing_witho', 0, 0, 0, 0)

call vimtest#SaveOut()
call vimtest#Quit()
