" https://vim.fandom.com/wiki/Learn_to_use_help
" Press Enter to jump to the subject (topic) under the cursor.
" Press Backspace to return from the last jump.
" Press s to find the next subject, or S to find the previous subject.
" Press o to find the next option, or O to find the previous option.

nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<cr>
nnoremap <buffer> O ?'\l\{2,\}'<cr>
nnoremap <buffer> s /\|\zs\S\+\ze\|<cr>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<cr>
