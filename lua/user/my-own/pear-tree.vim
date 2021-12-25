"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tmsvg/pear-tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tmsvg/pear-tree'

" I don't want closings to disappear
let g:pear_tree_repeatable_expand = 0

" Smart pairs are disabled by default
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1

" pear-tree borks telescope's <CR> imap and other stuff
let g:pear_tree_ft_disabled = ['TelescopePrompt']
