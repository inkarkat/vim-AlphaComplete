" Test repeat of alpha completion across lines.

source ../helpers/insert.vim
view AlphaComplete.txt
new

call SetCompletion("\<C-x>a")

call InsertRepeat('my:opt', 1, 0, 0, 0, 0, 0)
call InsertRepeat('my:opt', 2, 0, 0, 0, 0, 0)

call vimtest#SaveOut()
call vimtest#Quit()
