" Test completion of alphabetic characters.

set completefunc=AlphaComplete#AlphaComplete
edit AlphaComplete.txt

runtime tests/helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(7)

call IsMatchesInIsolatedLine('doesnotexist', [], 'no matches for doesnotexist')
call IsMatchesInIsolatedLine('313', ['FindMatchesInCurrentWindow', 'FindMatchesInOtherWindows', 'MyScript', 'PathAndNameWithoutExtension', 'and', 'any', 'bad', 'but', 'call', 'code', 'crazy', 'dpn', 'extension', 'frazzler', 'frobnicator', 'global', 'here', 'm', 'match', 'matches', 'my', 'name', 'negative', 'neither', 'not', 'option', 'options', 'or', 'path', 'pattern', 'patterns', 'prefixed', 'script', 'set', 'some', 'this', 'underscore', 'without'], 'all matches for 313')
call IsMatchesInIsolatedLine('_fro', ['frobnicator'], 'match for _fro')
call IsMatchesInIsolatedLine('_fr', ['frazzler', 'frobnicator'], 'matches for _fr')
call IsMatchesInIsolatedLine('stuff_with', ['without'], 'match for stuff_with')
call IsMatchesInIsolatedLine('my-mat', ['match', 'matches'], 'matches for my-mat')
call IsMatchesInIsolatedLine('local:F', ['FindMatchesInCurrentWindow', 'FindMatchesInOtherWindows'], 'matches for local:F')

call vimtest#Quit()
