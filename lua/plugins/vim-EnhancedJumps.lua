vim.cmd([[
" turn off the capture of jump messages on another buffer
let g:EnhancedJumps_CaptureJumpMessages = 0
" disable all mappings
let g:EnhancedJumps_no_mappings = 1

" only local jumps
nnoremap <C-o>          <Plug>EnhancedJumpsLocalOlder
nnoremap <C-i>          <Plug>EnhancedJumpsLocalNewer

" only remote jumps
nnoremap <A-o>   <Plug>EnhancedJumpsRemoteOlder
nnoremap <A-i>   <Plug>EnhancedJumpsRemoteNewer

" both local and remote jumps
" nnoremap <C-w>{      <Plug>EnhancedJumpsSwitchRemoteOlder
" nnoremap <C-w>}      <Plug>EnhancedJumpsSwitchRemoteNewer
]])
