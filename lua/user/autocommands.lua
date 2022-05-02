vim.cmd([[
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


" from https://github.com/kyazdani42/nvim-tree.lua#tips--reminders
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" format on save except c for qmk
" autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
let ftToIgnore = ['c', 'markdown']
    autocmd BufWritePre * if index(ftToIgnore, &ft) < 0 | lua vim.lsp.buf.formatting_sync()

" https://neovim.io/doc/user/lua.html#lua-highlight
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}
]])
