vim.cmd([[
    " all mappings disabled except <C-n>
    let g:VM_default_mappings = 0
    " To change any mapping you must first initialize the variable:
    let g:VM_maps = {}
" Visual Cursors         \\c        create a column of cursors from visual mode
    let g:VM_maps['Add Cursor Down']    = '<C-Down>'
]])
