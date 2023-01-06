vim.cmd([[
" hi CharColor guifg=white guibg=NONE guisp=NONE gui=undercurl
" only gui matters for terminal
" ctermfg=white ctermbg=NONE cterm=bold,nocombine
highlight CharColor guibg=#76946A gui=bold,nocombine

" search a char only in current line
let g:clever_f_across_no_line=1

" case insensitive
let g:clever_f_ignore_case=1

" search by smart case
let g:clever_f_smart_case=1

" highlight all char which can be directly jumped to
let g:clever_f_mark_direct=0

" target char highlighting
let g:clever_f_mark_char_color = "CharColor"

" highlight timeout (default: no timeout)
" let g:clever_f_highlight_timeout_ms=3000

" match all symbols with one char
let g:clever_f_chars_match_any_signs=";"

]])
