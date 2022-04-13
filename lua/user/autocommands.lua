vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

"  augroup _alpha
"    autocmd!
"    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
"  augroup end
" from https://github.com/kyazdani42/nvim-tree.lua#tips--reminders
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
