--local status_ok, executioner = pcall(require, "executioner")
--if not status_ok then
--	return
--end

vim.cmd([[
" Run current buffer with input redirected from input.txt
"nnoremap <silent> <leader>ri :ExecutionerBuffer % < input.txt<cr>
"nnoremap <silent> <leader>hri :ExecutionerHorizontalBuffer % < input.txt<cr>
"nnoremap <silent> <leader>vri :ExecutionerVerticalBuffer % < input.txt<cr>

"Due to the complexity of many projects, I use makefiles and run.sh to compile and run code without needing to worry about what file I'm currently editing.
" run.sh
"nnoremap <silent> <leader>rr :Executioner run.sh<cr>
"nnoremap <silent> <leader>hrr :ExecutionerHorizontal run.sh<cr>
"nnoremap <silent> <leader>vrr :ExecutionerVertical run.sh<cr>

" Makefile
"nnoremap <silent> <leader>rm :Executioner makefile<cr>
"nnoremap <silent> <leader>hrm :ExecutionerHorizontal makefile<cr>
"nnoremap <silent> <leader>vrm :ExecutionerVertical makefile<cr>
]])

