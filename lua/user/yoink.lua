vim.cmd([[
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkSavePersistently = 1
let g:yoinkMoveCursorToEndOfPaste = 1

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap <leader>n <plug>(YoinkPostPasteSwapBack)
nmap <leader>p <plug>(YoinkPostPasteSwapForward)
]])
