ALPHA COMPLETE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

The built-in insert mode completion i\_CTRL-N searches for keywords. When you
want to complete from fragments of variables (e.g. "frobnicator" from
"m\_frobnicator"), it won't work. Same when you have a keyword prefix before
your completion base (e.g. "\_fro" won't find "frobnicator").
This plugin offers completion of sequences of alphabetic characters ([A-Za-z],
/\\a), and therefore can complete from text fragments or when there are
non-alphabetic keyword characters in front of the completion base.

### SEE ALSO

- Check out the CompleteHelper.vim plugin page ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) for a full
  list of insert mode completions powered by it.

USAGE
------------------------------------------------------------------------------

    In insert mode, invoke the alphabetic completion via CTRL-X a
    You can then search forward and backward via CTRL-N / CTRL-P, as usual.

    CTRL-X a                Find matches for whole fragments of alphabetic
                            characters.
                            Further use of CTRL-X a will copy the text including
                            the next alphabetic fragments following the previous
                            expansion in other contexts.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-AlphaComplete
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim AlphaComplete*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.010 or
  higher.
- Requires the CompleteHelper.vim plugin ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)), version 1.40 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

By default, the 'complete' option controls which buffers will be scanned for
completion candidates. You can override that either for the entire plugin, or
only for particular buffers; see CompleteHelper\_complete for supported
values.

    let g:AlphaComplete_complete = '.,w,b,u'

If you want to use a different mapping, map your keys to the
&lt;Plug&gt;(AlphaComplete) mapping target _before_ sourcing the script (e.g.
in your vimrc):

    imap <C-x>a <Plug>(AlphaComplete)

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-AlphaComplete/issues or email (address below).

HISTORY
------------------------------------------------------------------------------

##### 1.01    RELEASEME
- Make repeat across lines work.

__You need to update to CompleteHelper.vim
  ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) version 1.40!__
- Remove default g:AlphaComplete\_complete configuration and default to
  'complete' option value instead.

##### 1.00    04-Apr-2014
- First published version.

##### 0.01    12-Sep-2012
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2012-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
