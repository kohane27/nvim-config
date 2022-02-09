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
"
  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
  augroup end

]]
