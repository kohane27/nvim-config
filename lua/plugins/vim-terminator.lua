vim.cmd([[
  let g:terminator_clear_default_mappings = "true"
  " let g:terminator_auto_shrink_output = 1

vnoremap <silent> <leader>rf :TerminatorRunPartOfFileInOutputBuffer<CR>

let g:terminator_runfile_map = {
            \ "javascript": "node",
            \ "typescript": "node --no-warnings --experimental-specifier-resolution=node --loader ts-node/esm",
            \ "python": "python -u",
            \ "c": "gcc $dir$fileName -o $dir$fileNameWithoutExt && $dir$fileNameWithoutExt",
            \ }
]])
