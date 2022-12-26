vim.cmd([[
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 0

" Replace `$EDITOR` candidate with this command to open the selected file
let g:rnvimr_edit_cmd = 'drop'

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70

" Draw border with both
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-w>o': 'NvimEdit drop',
            \ '<C-w>s': 'NvimEdit split',
            \ '<C-w>v': 'NvimEdit vsplit',
            \ 'gW': 'JumpNvimCwd',
            \ 'yW': 'EmitRangerCwd'
            \ }
]])
