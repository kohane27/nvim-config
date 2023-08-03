-- create a column of cursors from visual mode
vim.api.nvim_set_keymap(
  "n",
  "<C-S-n>",
  ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
  { noremap = true, silent = true }
)

vim.cmd([[
    " all mappings disabled except <C-n> (<C-n> can't be remapped)
    let g:VM_default_mappings = 0
    " disable warning
    " let g:VM_show_warnings = 0

    " To change any mapping you must first initialize the variable:
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = "<C-n>"

    " https://github.com/mg979/vim-visual-multi/issues/172
    let g:VM_maps['I BS'] = "" " disable backspace mapping
    let g:VM_maps['I CtrlC'] = "" " disable backspace mapping

]])
