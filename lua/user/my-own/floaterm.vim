Plug 'voldikss/vim-floaterm'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let g:floaterm_wintitle=0
let g:floaterm_wintype='float'
let g:floaterm_position='center'
let g:floaterm_autoclose=1
let g:floaterm_autoinsert=1
let g:floaterm_opener='tabe'

" https://github.com/voldikss/vim-floaterm/issues/140
"tnoremap <M-h> <C-\><C-n><C-w>h
"tnoremap <M-j> <C-\><C-n><C-w>j
"tnoremap <M-k> <C-\><C-n><C-w>k
"tnoremap <M-l> <C-\><C-n><C-w>l

"augroup FloatermCustomisations
"    autocmd!
"    autocmd ColorScheme * highlight FloatermBorder guibg=none
"augroup END
"
