vim.cmd([[
" turn off the capture of jump messages on another buffer
let g:EnhancedJumps_CaptureJumpMessages = 0
" disable all mappings
let g:EnhancedJumps_no_mappings = 1

" only local jumps
nnoremap <C-o>          <Plug>EnhancedJumpsLocalOlder
nnoremap <C-i>          <Plug>EnhancedJumpsLocalNewer
" nnoremap <silent> <C-o> :call EnhancedJumpsLocalOlder()<cr>
" nnoremap <silent> <C-i> :call EnhancedJumpsLocalNewer()<cr>

" only remote jumps
nnoremap <silent> <A-o>   <Plug>EnhancedJumpsRemoteOlder
nnoremap <silent> <A-i>   <Plug>EnhancedJumpsRemoteNewer

" function! EnhancedJumpsLocalOlder()
"     try
"      :execute "normal \<Plug>EnhancedJumpsLocalOlder<cr>"
"      :execute "normal zz<cr>"
"     catch /^Vim\%((\a\+)\)\=:E21/
"         call SendMessage(v:exception, v:errmsg)
"     endtry
" endfunction
"
" function! EnhancedJumpsLocalNewer()
"     try
"      :execute "normal \<Plug>EnhancedJumpsLocalNewer<cr>"
"      :execute "normal zz<cr>"
"     catch /^Vim\%((\a\+)\)\=:E21/
"         call SendMessage(v:exception, v:errmsg)
"     endtry
" endfunction
]])
