vim.cmd([[
    " all mappings disabled except <C-n>
    let g:VM_default_mappings = 0
    " To change any mapping you must first initialize the variable:
    let g:VM_maps = {}
    " let g:VM_maps['Add Cursor Down']    = '<C-Down>'

" create a column of cursors from visual mode
" map("n", "<A-m>", ":call vm#commands#add_cursor_down(0, v:count1)<cr>")

" exit VM with <C-C>
fun! VM_Start()
  nmap <buffer> <C-C> <Esc>
  imap <buffer> <C-C> <Esc>
endfun

fun! VM_Exit()
  nunmap <buffer> <C-C>
  iunmap <buffer> <C-C>
endfun
]])
